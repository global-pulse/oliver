class Tool
  include Mongoid::Document

  field :name
  field :description
  field :repository
  field :source
  field :url
end
