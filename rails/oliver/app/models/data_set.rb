class DataSet < DataSource
  belongs_to :data_source
  
  field :name, :type => String
  field :uri, :type => String
  field :description, :type => String
end
