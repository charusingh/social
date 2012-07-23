class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :friendships,:foreign_key=>"user_id"
  has_many :event_users
  has_many :common_friendships, :class_name => 'Friendship'
 has_many :posts,  :foreign_key=>"user_id"
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
has_many :likes
  # Setup accessible (or protected) attributes for your model
  accepts_nested_attributes_for :event_users
  attr_accessible :email, :password, :password_confirmation,
    :remember_me,:firstname,:middlename,:lastname, :age,
    :dob, :phno, :address, :sconame, 
    :scoaddress,:avtar,:event_user_attributes,:user_id
  # attr_accessible :title, :body
has_attached_file :avtar, :styles =>
  { :medium => "300x300>", :thumb => "300x300>",:small=>"50x50" }
end
