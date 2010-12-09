class PulseApplication
  include MongoMapper::Document

  key :name, String
  key :description, String
  key :git_hub_repository, String
  key :source, String
  key :url, String
end