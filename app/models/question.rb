class Question < ActiveRecord::Base
  belongs_to :user
  validates :category, :text, :answer, presence: true


end
