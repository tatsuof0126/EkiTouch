require 'test_helper'

class StationsControllerTest < ActionController::TestCase
  setup do
    @station = stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create station" do
    assert_difference('Station.count') do
      post :create, station: { f_flag: @station.f_flag, lat: @station.lat, line_cd: @station.line_cd, line_name: @station.line_name, line_sort: @station.line_sort, lon: @station.lon, pref_cd: @station.pref_cd, r_type: @station.r_type, rr_cd: @station.rr_cd, rr_name: @station.rr_name, station_cd: @station.station_cd, station_g_cd: @station.station_g_cd, station_name: @station.station_name, station_sort: @station.station_sort }
    end

    assert_redirected_to station_path(assigns(:station))
  end

  test "should show station" do
    get :show, id: @station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @station
    assert_response :success
  end

  test "should update station" do
    put :update, id: @station, station: { f_flag: @station.f_flag, lat: @station.lat, line_cd: @station.line_cd, line_name: @station.line_name, line_sort: @station.line_sort, lon: @station.lon, pref_cd: @station.pref_cd, r_type: @station.r_type, rr_cd: @station.rr_cd, rr_name: @station.rr_name, station_cd: @station.station_cd, station_g_cd: @station.station_g_cd, station_name: @station.station_name, station_sort: @station.station_sort }
    assert_redirected_to station_path(assigns(:station))
  end

  test "should destroy station" do
    assert_difference('Station.count', -1) do
      delete :destroy, id: @station
    end

    assert_redirected_to stations_path
  end
end
