require 'test_helper'

class DataSetBuilderTest < ActiveSupport::TestCase
  setup do
    @raw_data = <<-EOD
<datasets>
  <dataset organisation='IMF' category='International Financial statistics' name='BOP: capital account credit, US$'  />
  <dataset organisation='IMF' category='International Financial statistics' name='BOP: capital account debit, US$'  />
</datasets>
    EOD

  end

  test "datasets creates a selector for a new dataset" do
    builder = DataSetBuilder.new("")

    builder.datasets :selector => '/dataset'

    assert_equal 1, builder.dataset_selectors.size
    assert_equal '/dataset', builder.dataset_selectors[0][:selector]
  end

  test "can define the name of a new datset" do
    builder = DataSetBuilder.new("")

    builder.datasets :selector => '/dataset' do
      dataset :name => select('[@name]')
    end

    assert_equal 1, builder.dataset_selectors.size
    assert_equal 1, builder.dataset_selectors.first.definitions.size
  end

  test "build extracts data sets from supplied data" do
    builder = DataSetBuilder.new("")

    builder.datasets :selector => '/datasets/dataset' do
      dataset :name_selector => '@name'
    end
    ds = DataSource.new(:name => "foo")

    builder.build(@raw_data, ds)

    assert_equal 2, ds.data_sets.size
    assert_equal "BOP: capital account credit, US$", ds.data_sets.first.name
  end
end