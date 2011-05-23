class DataSource
  include Mongoid::Document

  field :name
  key :name
  field :url
  field :api_key
  field :source
  field :client_adaptor
  field :catalogue
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

  validates_presence_of :name, :on => :create, :message => "A unique data source name is required"

  embeds_many :comments
  has_many :data_sets

  def test
    adaptor = eval(client_adaptor)

    adaptor.data_sets
  end
end
