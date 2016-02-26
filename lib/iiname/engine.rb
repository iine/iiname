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
        search_by_google(@keyword)
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

      team_name = search_by_google(keyword).sample || "No name"

      return team_name
    end

    # google search
    def search_by_google(keyword)
      puts("start search_by_google(" << keyword << ")");

      ret = Array.new()
      Google::Search::Book.new(:query => keyword).each do |item|
        #puts "title=#{item.title}"
        ret << item
      end
      puts("return #{ret.length} items")
      #puts("#{ret}")
      return ret
    end
  end
end
