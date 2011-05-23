require 'test_helper'

class DataSetsControllerTest < ActionController::TestCase
  setup do
    @data_source = DataSource.new(:name => "Foo")
    @data_source.save
    @data_set = @data_source.data_sets.build(:name => "bar")
  end

  teardown do
    @data_source.delete
    @data_set.delete unless @data_set.deleted?
  end

  test "should get index" do
    get :index, :data_source_id => @data_source.to_param
    assert_response :success
    assert_not_nil assigns(:data_sets)
  end

  test "should get new" do
    get :new, :data_source_id => @data_source.to_param
    assert_response :success
  end

  test "should create data_set" do
    assert_difference('DataSet.count') do
      post :create, :data_source_id => @data_source.to_param, :data_set => @data_set.attributes
    end

    assert_redirected_to data_source_data_set_path(@data_source.to_key, assigns(:data_set))
  end

  test "should show data_set" do
    @data_set.save
    get :show, :data_source_id => @data_source.to_param, :id => @data_set.to_param
    assert_response :success
  end

  test "should get edit" do
    @data_set.save
    get :edit, :data_source_id => @data_source.to_param,  :id => @data_set.to_param
    assert_response :success
  end

  test "should update data_set" do
    @data_set.save
    put :update, :data_source_id => @data_source.to_param, :id => @data_set.to_param, :data_set => @data_set.attributes
    assert_redirected_to data_source_data_set_path(@data_source.to_param, assigns(:data_set))
  end

  test "should destroy data_set" do
    @data_set.save
    assert_difference('DataSet.count', -1) do
      delete :destroy, :data_source_id => @data_source.to_param, :id => @data_set.to_param
    end

    assert_redirected_to data_source_data_sets_path(@data_source.to_param)
  end
end
