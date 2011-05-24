require 'net/http'

class DataSet
  include Mongoid::Document
  belongs_to :data_source

  field :name, :type => String
  field :uri, :type => String
  field :description, :type => String
  field :raw_data, :type => String
  field :transform_script, :type => String
  field :data, :type => Array

  def refresh_data(host_adaptor)
    u             = URI::parse(URI.escape(uri))
    self.raw_data = host_adaptor.get(u)
  end

  def transform(mapping)
    dt        = DataTransformation.new(mapping)
    self.data = []
    dt.transform(self.raw_data, self.data)
  end
end
