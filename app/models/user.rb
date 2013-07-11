class User < ActiveRecord::Base
  has_secure_password

  has_many :questions, inverse_of: :user
  has_many :games, inverse_of: :user

  validates_presence_of :username, :email
  validates_uniqueness_of :email, :username
  validates_format_of :email, 
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
                      :on => :create
  validates_length_of :password, :in => 7..15, :on => :create

  default_scope order('created_at DESC')
  
end
