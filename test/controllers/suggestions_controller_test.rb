require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase
  setup do
    @suggestion = suggestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suggestions)
  end

  test "should assign all suggestion" do
    get :index
    # Suggestionの全件が取得出来ていることを確認します
    # controllerのテストで、assigns関数は、controllerインスタンスのメンバ変数を指定してhashキーで取得するのに使います
    assert_equal Suggestion.all, assigns(:suggestions)
  end

  test "should show suggestion" do
    get :show, id: @suggestion
    assert_response :success
  end

  test "should have one of suggestions" do
    get :show, id: "any"
    # Suggestion全件の中の任意の1件が取得できていることを確認します
    assert_includes Suggestion.all, assigns(:suggestion)
  end
end
