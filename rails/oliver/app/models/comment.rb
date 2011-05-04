class Comment
  include Mongoid::Document
  field :name
  field :content

  embedded_in :data_source, :inverse_of => :comments
end
