class DataSource
  include Mongoid::Document

  field :name
  field :source
  field :generatingagency
  field :dataformat
  field :acquisitondate
  field :contributoruid
  field :affiliation
  field :whocanview
  field :whocanedit
  field :whocanadmit
  field :dataquality
  field :datastandards
  field :metatdatalink
  field :apilink
  field :url

  validates_presence_of :name, :on => :create, :message => "A unique data source name is required"

  embeds_many :comments
end
