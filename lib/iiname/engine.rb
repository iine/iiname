module Iiname
  class Engine

    include Enumerable

    def initialize(params={})
      @params = params
      @language = params.delete(:language) || :ja
      @keyword = params.delete(:keyword)
      @mode = params.delete(:mode) || :web
    end

    def each_item &block
      self.fetch.each { |item| yield item }
    end
    alias :each :each_item

    def fetch
      puts("@mode = #{@mode}")
      case @mode
      when :web
        Google::Search::Web.new(query: @keyword, language: @language).to_a
      when :trend_story
        search_by_trend_story
      when :hot_trend
        search_by_hot_trend
      when :book
        search_by_webapi(@keyword)
      else
        Google::Search::Web.new(query: @keyword, language: @language).to_a
      end
    end

    private
    def search_by_trend_story
      prefix = ")]}'"
      conn = Faraday.new(:url => 'https://www.google.com') do |builder|
        builder.request  :url_encoded
        builder.response :logger
        builder.adapter  :net_http
      end
      response = conn.get "/trends/api/stories/latest?cat=all&fi=0&fs=0&geo=JP&ri=300&rs=15&tz=-540"
      if response.body.index(prefix) == 0
        body = response.body[prefix.length..response.body.length]
      else
        body = response.body
      end
      json = JSON.parse body
      json["storySummaries"]["trendingStories"].map do | story |
        story["entityNames"]
      end.flatten
    end

    def search_by_hot_trend
      conn = Faraday.new(:url => 'https://www.google.com') do |builder|
        builder.request  :url_encoded
        builder.response :logger
        builder.adapter  :net_http
      end
      response = conn.get "/trends/hottrends/hotItems?ajax=1&pn=p4&htv=l"
      json = JSON.parse response.body
      json["trendsByDateList"].map do | date |
        date["trendsList"].map do | story |
          story["title"]
        end
      end.flatten
    end

    # get names through web api
    def search_by_webapi(keyword)
      puts("start search_by_webapi(", keyword, ")");

      team_name = "No name"

      # get team name through rakuten api
      items = search_by_rakuten(keyword)
      if (items.count != 0) then
        item = items.sample
      else
        # get team name through google api
        item = search_by_google(keyword).sample
      end

      puts("class = ",item.class)
      puts("#{item.title} by #{item.author}")
      team_name = item.title
      return team_name
    end

    # rakten search
    def search_by_rakuten(keyword)
      puts("start search_by_rakuten(", keyword, ")");

      # configure environmental variables
      RakutenWebService.configuration do |c|
        c.application_id = ENV["APPID"]
        c.affiliate_id = ENV["AFID"]
      end

      #r_items = RakutenWebService::Ichiba::Item.ranking(:age => 30, :sex => 0)
      #r_items = RakutenWebService::Books::CD.search(:title => keyword)
      #r_items = RakutenWebService::Books::CD.search(:artistName => keyword)
      #r_items = RakutenWebService::Books::Book.search(:title => keyword)
      r_items = RakutenWebService::Books::Book.search(:author => keyword, :page => 1)

      items = r_items.to_a

      puts("rakuten_web_service hit #{items.count} items.")
      #items.each_with_index do |item, i| puts "#{i}: #{item.class} title=#{item.title}" end
      puts("return is #{items.class}")
      return items
    end

    # google search
    def search_by_google(keyword)
      puts("start search_by_google(" << keyword << ")");
      items = Google::Search::Book.new(:query => keyword).to_a
      puts("google_web_service hit #{items.count} items.");
      # items.each_with_index do |item, i| puts "#{i}: #{item.class} title=#{item.title}" end
      puts("return is #{items.class}")
      return items
    end
  end
end
