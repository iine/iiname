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

  test "should return expected result names" do
    names = ["空条承太郎", "ジャン=ピエール・ポルナレフ"]
    create_trend_search_stub(names)
    assert_equal(names, Iiname::Engine.new(mode: :trend_story).fetch)
  end

  test "should return expected hot trend result names" do
    name = "空条承太郎"
    create_hot_trend_search_stub(name)
    assert_equal([name], Iiname::Engine.new(mode: :hot_trend).fetch)
  end

  test "should return some results of book titles" do
    create_google_book_search_stub
    key = "長嶋茂雄"
    title = "［完全版］長嶋茂雄大事典"
    assert_equal(title, Iiname::Engine.new(keyword: key, mode: :book).first.title)
  end
end
