class User
  include Mongoid::Document
  field :display_name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  def to_s
    display_name.nil? ? email : display_name
  end
end
