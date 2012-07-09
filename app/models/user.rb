class User < ActiveRecord::Base
  # Include default devise modules. Others available are

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :remember_me,:firstname,:lastname,
    :education_details,:contact,:email, :password, :password_confirmation, :avtar
  has_attached_file :avtar, :styles =>
           { :medium => "300x300>", :thumb => "100x100>" }

 
  has_many :friendships, :foreign_key => "user_id"
 
end
