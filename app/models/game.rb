class Game < ActiveRecord::Base
  belongs_to :user
  has_many :responses, inverse_of: :game
  has_many :questions, through: :responses, inverse_of: :game 
end
