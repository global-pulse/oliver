require 'test_helper'

class VisualisationsControllerTest < ActionController::TestCase
  setup do
    @visualisation = Visualisation.new(:name => "v")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visualisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visualisation" do
    assert_difference('Visualisation.count') do
      post :create, :visualisation => @visualisation.attributes
    end

    assert_redirected_to visualisation_path(assigns(:visualisation))
  end

  test "should show visualisation" do
    @visualisation.save
    get :show, :id => @visualisation.to_param
    assert_response :success
  end

  test "should get edit" do
    @visualisation.save
    get :edit, :id => @visualisation.to_param
    assert_response :success
  end

  test "should update visualisation" do
    @visualisation.save
    put :update, :id => @visualisation.to_param, :visualisation => @visualisation.attributes
    assert_redirected_to visualisation_path(assigns(:visualisation))
  end

  test "should destroy visualisation" do
    @visualisation.save
    
    assert_difference('Visualisation.count', -1) do
      delete :destroy, :id => @visualisation.to_param
    end

    assert_redirected_to visualisations_path
  end
end
