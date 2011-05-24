class Comment
  include Mongoid::Document
  field :content

  belongs_to :data_source
  belongs_to :user
end
