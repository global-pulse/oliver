require 'test_helper'

class DataSourceTest < ActiveSupport::TestCase
  test "can instantiate a data source" do
    ds = DataSource.new(:name => "foo")
    
    assert_equal "foo", ds.name
  end

  test "data sources have data sets" do
    ds = DataSource.new(:name => "foo")

    assert_equal 0, ds.data_sets.size()

    assert_equal "foo", ds.name

    ds.data_sets.build(:name => "some data set")

    assert_equal 1, ds.data_sets.size()
  end
end
