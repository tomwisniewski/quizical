class User < ActiveRecord::Base
  has_many :questions, inverse_of: :user
  has_many :games, inverse_of: :user
end
