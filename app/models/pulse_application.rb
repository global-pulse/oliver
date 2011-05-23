class PulseApplication
  include Mongoid::Document

  field :name
  field :description
  field :git_hub_repository
  field :source
  field :url
end