require 'test_helper'

class TouchesControllerTest < ActionController::TestCase
  setup do
    @touch = touches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:touches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create touch" do
    assert_difference('Touch.count') do
      post :create, touch: { station_id: @touch.station_id, touched_date: @touch.touched_date, user_id: @touch.user_id }
    end

    assert_redirected_to touch_path(assigns(:touch))
  end

  test "should show touch" do
    get :show, id: @touch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @touch
    assert_response :success
  end

  test "should update touch" do
    put :update, id: @touch, touch: { station_id: @touch.station_id, touched_date: @touch.touched_date, user_id: @touch.user_id }
    assert_redirected_to touch_path(assigns(:touch))
  end

  test "should destroy touch" do
    assert_difference('Touch.count', -1) do
      delete :destroy, id: @touch
    end

    assert_redirected_to touches_path
  end
end
