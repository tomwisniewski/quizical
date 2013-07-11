class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :game, inverse_of: :responses
  validates_presence_of :question_id, :game_id, :value
end
