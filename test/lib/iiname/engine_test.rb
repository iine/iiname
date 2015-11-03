# -*- coding: utf-8 -*-
require 'test_helper'

class Iiname::EngineTest < ActiveSupport::TestCase

  setup do
    # WebMock.allow_net_connect!
    # create_search_stub
  end

  test "should be instance of Iiname::Engine " do
    create_search_stub
    assert_kind_of(Iiname::Engine, Iiname::Engine.new())
  end

  test "should return one result" do
    create_search_stub
    assert_equal(1, Iiname::Engine.new(keyword: "長嶋茂雄").to_a.size)
  end

  test "should return one result" do
    create_search_stub
    assert_equal(1, Iiname::Engine.new(keyword: "長嶋茂雄").to_a.size)
  end

  test "should return one result of book title" do
    #create_search_stub
    create_google_book_search_stub
    create_rakuten_search_stub("長嶋茂雄", 1)
    #create_rakuten_search_stub("長嶋茂雄", 2)
    #assert_kind_of(Iiname::Engine, Iiname::Engine.new(keyword: "長嶋茂雄").fetch(mode: "Book").first)
    assert_kind_of(RakutenWebService::Book::Book, Iiname::Engine.new(keyword: "長嶋茂雄").fetch(mode: "Book").first)
  end

  test "should return one result of book title" do
    create_google_book_search_stub
    create_rakuten_search_stub("長嶋茂雄", 1)
    create_rakuten_search_stub("長嶋茂雄", 2)
    assert_equal(1, Iiname::Engine.new(keyword: "長嶋茂雄").fetch(mode: "Book").size)
  end
end
