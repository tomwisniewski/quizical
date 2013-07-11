require 'spec_helper'


describe Question do

  it 'should be possible to add a question with true answer' do
    question = Question.new(user_id: 1, category: "Food & Wine", text: "A brie is a type of cheese", answer: true)
    question.valid?.should be true
    question.save!
  end

  it 'should be possible to add a question with false answer' do
    question = Question.new(user_id: 1, category: "Food & Wine", text: "A brie is a type of cheese", answer: false)
    question.valid?.should be true
  end

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

  it 'should not be possible to add a question with a string' do
    question = Question.new(user_id: 1, category: "", text: "A morbier is a type of cheese", answer: "false")
    question.valid?.should be false
  end


end
