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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prefecture" do
    assert_difference('Prefecture.count') do
      post :create, prefecture: { prefecture: @prefecture.prefecture, prefecture_id: @prefecture.prefecture_id }
    end

    assert_redirected_to prefecture_path(assigns(:prefecture))
  end

  test "should show prefecture" do
    get :show, id: @prefecture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prefecture
    assert_response :success
  end

  test "should update prefecture" do
    patch :update, id: @prefecture, prefecture: { prefecture: @prefecture.prefecture, prefecture_id: @prefecture.prefecture_id }
    assert_redirected_to prefecture_path(assigns(:prefecture))
  end

  test "should destroy prefecture" do
    assert_difference('Prefecture.count', -1) do
      delete :destroy, id: @prefecture
    end

    assert_redirected_to prefectures_path
  end
end
