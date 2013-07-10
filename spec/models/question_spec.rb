require 'spec_helper'

describe Question do

  it 'should not be possible to add an empty question' do
    question = Question.new(user_id: 1, category: "Food & Wine", text: "", answer: true)
    question.valid?.should be false
  end

  it 'should not be possible to add an empty answer' do
    question = Question.new(user_id: 1, category: "Food & Wine", text: "A morbier is a type of cheese")
    question.valid?.should be false
  end

  it 'should not be possible to add an empty category' do
    question = Question.new(user_id: 1, category: "", text: "A morbier is a type of cheese", answer: true)
    question.valid?.should be false
  end


end
