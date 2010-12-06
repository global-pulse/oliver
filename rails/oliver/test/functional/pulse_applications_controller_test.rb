require 'test_helper'

class PulseApplicationsControllerTest < ActionController::TestCase
  setup do
    @pulse_application = pulse_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pulse_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pulse_application" do
    assert_difference('PulseApplication.count') do
      post :create, :pulse_application => @pulse_application.attributes
    end

    assert_redirected_to pulse_application_path(assigns(:pulse_application))
  end

  test "should show pulse_application" do
    get :show, :id => @pulse_application.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pulse_application.to_param
    assert_response :success
  end

  test "should update pulse_application" do
    put :update, :id => @pulse_application.to_param, :pulse_application => @pulse_application.attributes
    assert_redirected_to pulse_application_path(assigns(:pulse_application))
  end

  test "should destroy pulse_application" do
    assert_difference('PulseApplication.count', -1) do
      delete :destroy, :id => @pulse_application.to_param
    end

    assert_redirected_to pulse_applications_path
  end
end
