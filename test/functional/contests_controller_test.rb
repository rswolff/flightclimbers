require 'test_helper'

class ContestsControllerTest < ActionController::TestCase
  setup do
    @contest = contests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contest" do
    assert_difference('Contest.count') do
      post :create, contest: { ascend_value: @contest.ascend_value, descen_value: @contest.descen_value, end_date: @contest.end_date, name: @contest.name, registration_fee_cents: @contest.registration_fee_cents, start_date: @contest.start_date }
    end

    assert_redirected_to contest_path(assigns(:contest))
  end

  test "should show contest" do
    get :show, id: @contest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contest
    assert_response :success
  end

  test "should update contest" do
    put :update, id: @contest, contest: { ascend_value: @contest.ascend_value, descen_value: @contest.descen_value, end_date: @contest.end_date, name: @contest.name, registration_fee_cents: @contest.registration_fee_cents, start_date: @contest.start_date }
    assert_redirected_to contest_path(assigns(:contest))
  end

  test "should destroy contest" do
    assert_difference('Contest.count', -1) do
      delete :destroy, id: @contest
    end

    assert_redirected_to contests_path
  end
end
