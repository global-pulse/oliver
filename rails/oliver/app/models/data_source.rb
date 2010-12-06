class DataSource
  include MongoMapper::Document

  key :name, String
  key :source, String
end
