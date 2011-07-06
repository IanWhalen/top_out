require 'test_helper'

class ClimbingSessionsControllerTest < ActionController::TestCase
  setup do
    @climbing_session = climbing_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climbing_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climbing_session" do
    assert_difference('ClimbingSession.count') do
      post :create, :climbing_session => @climbing_session.attributes
    end

    assert_redirected_to climbing_session_path(assigns(:climbing_session))
  end

  test "should show climbing_session" do
    get :show, :id => @climbing_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @climbing_session.to_param
    assert_response :success
  end

  test "should update climbing_session" do
    put :update, :id => @climbing_session.to_param, :climbing_session => @climbing_session.attributes
    assert_redirected_to climbing_session_path(assigns(:climbing_session))
  end

  test "should destroy climbing_session" do
    assert_difference('ClimbingSession.count', -1) do
      delete :destroy, :id => @climbing_session.to_param
    end

    assert_redirected_to climbing_sessions_path
  end
end
