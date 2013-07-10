class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :game, inverse_of: :responses
end
