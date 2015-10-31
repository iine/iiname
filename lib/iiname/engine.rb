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
      case @mode
      when :web
        Google::Search::Web.new(query: @keyword, language: @language).to_a
      when :trend_story
        search_by_trend_story
      when :hot_trend
        search_by_hot_trend
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
  end
end