require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase
  setup do
    @title = "花京院典明"
    create_search_stub(@title)
    @names = [@title]
    create_trend_search_stub(@names)
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
    skip "deprecated"
    get :show, id: "any"
    # Suggestion全件の中の任意の1件が取得できていることを確認します
    assert_includes Suggestion.all, assigns(:suggestion)
  end

  test "should expected keyword" do
    # object = mock('object')
    # object.expects(:fetch).returns(@names)
    # web_search_engine = Iiname::Engine.new(keyword: @title)
    # Iiname::Engine.expects(:new).with(mode: :trend_story).returns(object)
    # Iiname::Engine.expects(:new).with(keyword: @title).returns(web_search_engine)
    get :show, id: "any", format: :json
    assert ["花京院", "典明", "典明花京院", @title].any? {| word | word == JSON.parse(response.body)["keyword"] }
  end

  test "places parameter should return word to be joined" do
    words = ["札幌", "小樽"]
    get :show, {id: "any", places: words}, format: :json
    response_key = JSON.parse(response.body)["keyword"]
    assert (response_key.include?(words[0]) || response_key.include?(words[1]))
  end
end
