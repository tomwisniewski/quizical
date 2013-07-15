class Game < ActiveRecord::Base
  belongs_to :user
  has_many :responses, inverse_of: :game
  has_many :questions, through: :responses, inverse_of: :game

  def active_game?(question_number)
    self.question_limit > question_number
  end

  def game_over
  end

end
