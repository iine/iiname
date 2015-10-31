require 'test_helper'

class NamesControllerTest < ActionController::TestCase
  setup do
    WebMock.allow_net_connect!
    # @params1 = { names: ["abc"]}
    @params = { names: ["abc", "def"]}
  end

  test "should get success response" do
    get :suggestion, @params
    assert_response :success
  end

  # test "should concat params and return as keyword" do
  #   get :suggestion, @params
  #   assert_equal @params[:names].join(""), JSON.parse(response.body)["keyword"]
  # end

  # test "should search book title by google and return as keyword" do
  #   get :suggestion, @params
  #   assert_equal NamesController.new.suggestion_by_webapi("abc def"), JSON.parse(response.body)["keyword"]
  # end

  # test "should search book title by rakuten and return as keyword" do
  #   get :suggestion, @params1
  #   assert_equal NamesController.new.suggestion_by_webapi("abc"), JSON.parse(response.body)["keyword"]
  # end
end
