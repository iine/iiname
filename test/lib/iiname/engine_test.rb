# -*- coding: utf-8 -*-
require 'test_helper'

class Iiname::EngineTest < ActiveSupport::TestCase

  setup do
    #WebMock.allow_net_connect!
    #create_search_stub
  end

  test "should be instance of Iiname::Engine " do
    assert_kind_of(Iiname::Engine, Iiname::Engine.new())
  end

  test "should return one result" do
    assert_equal(1, Iiname::Engine.new(keyword: "長嶋茂雄").to_a.first.size)
  end

  test "should return one result of book title" do
    assert_kind_of(Iiname::Engine, Iiname::Engine.new(keyword: "長嶋茂雄").fetch(mode: "Book").first)
  end

  test "should return one result of book title" do
    assert_equal(1, Iiname::Engine.new(keyword: "長嶋茂雄").fetch(mode: "Book").first.size)
  end
end
