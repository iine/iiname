require 'test_helper'

class NamesControllerTest < ActionController::TestCase
  setup do
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

  test "should search book title and return as keyword" do
    get :suggestion, @params
    assert_equal "British Logic in the Nineteenth Century", JSON.parse(response.body)["keyword"]
  end

end
