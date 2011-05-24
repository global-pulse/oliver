require 'test_helper'

class DataSourceTest < ActiveSupport::TestCase
  setup do
    @raw_data = <<-EOD
<datasets>
<dataset organisation='IMF' category='International Financial statistics' name='BOP: capital account credit, US$'  />
<dataset organisation='IMF' category='International Financial statistics' name='BOP: capital account debit, US$'  />
<dataset organisation='IMF' category='International Financial statistics' name='BOP: current transfers credit, US$'  />
<dataset organisation='IMF' category='International Financial statistics' name='BOP: current transfers debit, US$'  />
<dataset organisation='IMF' category='International Financial statistics' name='BOP: exports of goods, f.o.b., US$'  />
<dataset organisation='IMF' category='International Financial statistics' name='BOP: financial account, US$'  />
<dataset organisation='IMF' category='International Financial statistics' name='BOP: imports of goods, f.o.b., US$'  />
</dataset>
    EOD
    @host_adaptor = stub(:get => @raw_data)
  end
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

  test "refresh updates the catalogue data" do
    ds = DataSource.new(:name => "foo", :uri => "http://some/uri")

    ds.refresh_catalogue(@host_adaptor)

    assert_equal @raw_data, ds.raw_catalogue
  end

  test "build data sets creates datasets names after the catalogue entries" do
    ds = DataSource.new(:name => "foo", :uri => "http://some/uri")
    ds.raw_catalogue = @raw_data

#    ds.build_data_sets("datasets :selector => '/datasets/dataset' do
#  dataset :name => select('[@name]')
#end")
#
#    assert_equal "BOP: capital account credit, US$", ds.data_sets.first.name,

  end
end
