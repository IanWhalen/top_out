require 'test_helper'

class CompletedProblemsControllerTest < ActionController::TestCase
  setup do
    @completed_problem = completed_problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:completed_problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create completed_problem" do
    assert_difference('CompletedProblem.count') do
      post :create, :completed_problem => @completed_problem.attributes
    end

    assert_redirected_to completed_problem_path(assigns(:completed_problem))
  end

  test "should show completed_problem" do
    get :show, :id => @completed_problem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @completed_problem.to_param
    assert_response :success
  end

  test "should update completed_problem" do
    put :update, :id => @completed_problem.to_param, :completed_problem => @completed_problem.attributes
    assert_redirected_to completed_problem_path(assigns(:completed_problem))
  end

  test "should destroy completed_problem" do
    assert_difference('CompletedProblem.count', -1) do
      delete :destroy, :id => @completed_problem.to_param
    end

    assert_redirected_to completed_problems_path
  end
end
