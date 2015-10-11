require 'test_helper'

class PrefecturesControllerTest < ActionController::TestCase
  setup do
    @prefecture = prefectures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prefectures)
  end

end
