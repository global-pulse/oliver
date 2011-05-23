require 'test_helper'

class DataTransformationTest < ActiveSupport::TestCase
  setup do
    @raw_data = <<-EOD
<data organisation="WHO" category="Health systems resources" name="Hospital beds (per 10 000 population)">
  <record>
    <field name="Country or Area">Afghanistan</field>
    <field name="Year(s)">2003</field>
    <field name="Value">4</field>
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
  end
  
  test "record creates a record entry" do
    dt = DataTransformation.new("")
    
    dt.record :selector => '/record'

    assert_equal 1, dt.record_selectors.size
    assert_equal '/record', dt.record_selectors[0][:selector]
  end
  
  test "can define field selectors inside record" do
    dt = DataTransformation.new("")
    
    dt.record :selector => '/record' do
      field :selector => 'field selector'
    end

    assert_equal 1, dt.record_selectors.size
    assert_equal 'field selector', dt.record_selectors[0].field_selectors[0][:selector]
    
  end
  
  test "can compile a text Transformation" do
    dt = DataTransformation.new("")
    
    dt.compile("record :selector => '/record' do field :selector => 'fs' end")
    
    assert_equal 1, dt.record_selectors.size
    assert_equal '/record', dt.record_selectors[0][:selector]
    assert_equal 'fs', dt.record_selectors[0].field_selectors[0][:selector]
  end
  
  test "compiled transform finds records" do
    dt = DataTransformation.new("")
    rs = DataTransformation::RecordSelector.new(:selector => '/data/record')
    rs.field_selectors << DataTransformation::RecordSelector::FieldSelector.new(:name => "area", :selector=>'field[@name="Country or Area"]')
    dt.record_selectors << rs

    output = []
    dt.transform(@raw_data, output)
    assert_equal 3, output.size
    assert_equal 'Afghanistan', output[0]['area']
  end
end