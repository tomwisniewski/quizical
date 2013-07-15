class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :game, inverse_of: :responses
  validates_presence_of :question_id, :game_id
  validates :value, :inclusion => {:in => [true, false]}
  validate :game_still_active?

  def game_still_active?
    questions_answered = Response.where(:game_id => game_id).count
    game = game(game_id)
    if !game.active_game?(questions_answered)
      errors.add(:base, "Game Over")
    end
  end

end
