# A DataSource represents an organisation that makes data available to others.
# A data source contains a number of DataSets that have ben used for analysis.
#
class DataSource
  include Mongoid::Document

  field :name
  field :uri
  field :api_key
  field :source
  field :client_adaptor
  field :catalogue, :type => Array
  field :raw_catalogue
  field :catalogue_script
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

  has_many :comments
  has_many :data_sets

  def test
    adaptor = eval(client_adaptor)

    adaptor.data_sets
  end

  def refresh_catalogue(host_adaptor)
    u                  = URI::parse(URI.escape(uri))
    self.raw_catalogue = host_adaptor.get(u)
  end

  def build_data_sets(script)
    dsb = DataSetBuilder.new(script)

    dsb.build(self)
  end

end
