require 'test_helper'

class DataSourcesControllerTest < ActionController::TestCase
  setup do
    @data_source = DataSource.new(:name => "Foo")
    assert_equal "Foo", @data_source.name
  end

  teardown do
    @data_source.delete unless @data_source.deleted?
  end

  test "should get index" do
    sign_in User.new
    get :index
    assert_response :success
    assert_not_nil assigns(:data_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

#  test "should create data source" do
#    sign_in User.new
#    ds = DataSource.new(:name => "bar1")
#    assert_difference('DataSource.count') do
#      post :create, :data_source => ds.attributes
#    end
#
#    assert_redirected_to data_source_path(assigns(:data_sources))
#    ds.delete
#  end

  test "should show data_set" do
    @data_source.save
    get :show, :id => @data_source.id
    assert_response :success
  end

end