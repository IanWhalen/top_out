require 'test_helper'

class CompletedRoutesControllerTest < ActionController::TestCase
  setup do
    @completed_route = completed_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:completed_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create completed_route" do
    assert_difference('CompletedRoute.count') do
      post :create, :completed_route => @completed_route.attributes
    end

    assert_redirected_to completed_route_path(assigns(:completed_route))
  end

  test "should show completed_route" do
    get :show, :id => @completed_route.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @completed_route.to_param
    assert_response :success
  end

  test "should update completed_route" do
    put :update, :id => @completed_route.to_param, :completed_route => @completed_route.attributes
    assert_redirected_to completed_route_path(assigns(:completed_route))
  end

  test "should destroy completed_route" do
    assert_difference('CompletedRoute.count', -1) do
      delete :destroy, :id => @completed_route.to_param
    end

    assert_redirected_to completed_routes_path
  end
end
