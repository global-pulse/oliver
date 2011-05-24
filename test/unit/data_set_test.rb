require 'test_helper'

class DataSetTest < ActiveSupport::TestCase
  setup do
    @raw_data = <<-EOD
<data organisation="WHO" category="Health systems resources" name="Hospital beds (per 10 000 population)">
  <record>
    <field name="Country or Area">Afghanistan</field><field name="Year(s)">2003</field><field name="Value">4</field>
  </record>
  <record>
    <field name="Country or Area">Albania</field>
    <field name="Year(s)">2006</field>
    <field name="Value">30</field>
  </record>
  <record>
    <field name="Country or Area">Algeria</field>
    <field name="Year(s)">2004</field>
    <field name="Value">17</field>
  </record>
</data>
    EOD

    @host_adaptor = stub(:get => @raw_data)
  end

  test "data set refresh fills raw data" do
    ds = DataSet.new(:name=> "foo", :uri => "http://some/uri")

    ds.refresh_data(@host_adaptor)
    assert_not_nil ds.raw_data
  end

  test "can transform raw data into hash" do
    ds = DataSet.new(:name=> "foo", :uri => "http://some/uri")

    ds.refresh_data(@host_adaptor)

    mapping = "
    record :selector => '/data/record' do
      field :name => 'area', :selector => 'field[@name=\"Country or Area\"]'
      field :name => 'year', :selector => 'field[@name=\"Year(s)\"]'
      field :name => 'Beds', :selector => 'field[@name=\"Value\"]'
    end
    "

    ds.transform(mapping)

    assert_equal 3, ds.data.length
    assert_equal 'Afghanistan', ds.data[0]['area']
  end
end
