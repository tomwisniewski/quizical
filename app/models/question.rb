class Question < ActiveRecord::Base
  belongs_to :user
  validates :category, presence: true
  validates :text, presence: true
  validates_inclusion_of :answer, :in => [true, false], :message => "question answer must be true or false"

  def self.pick
    Question.all.first
  end

  def self.generate_list(options = {})
    count = options[:count] || 1 
    question_array = Question
            .where("user_id != ?", options[:excluded_user])
            .order('RANDOM()')
            .limit(count)
            .select(:id)
    question_array.map{ |q| q.id }.join(',')
  end
end
