class Platform
  include Mongoid::Document

field :uid
field :name
field :affiliation
field :primarypurpose
field :bandwidth
field :latitude
field :longitude
field :verified
field :url
end
