module Iiname
  class Engine

    include Enumerable

    def initialize(params={})
      @params = params
      @language = params.delete(:language) || :ja
      @keyword = params.delete(:keyword)
    end

    def each_item &block
      self.fetch.each { |item| yield item }
    end
    alias :each :each_item

    def fetch
      Google::Search::Web.new(query: @keyword, language: @language).to_a
    end
  end
end