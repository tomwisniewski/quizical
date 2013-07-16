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

  it 'should not be possible to add a question with a string answer' do
    question = Question.new(user_id: 1, category: "General", text: "A morbier is a type of cheese", answer: "true")
    question.valid?.should be false
  end

  describe "question list generation" do
    before(:each) do
      @question1 = Question.create(user_id: 1, category: "General", text: "Question 1 for user 1", answer: true)
      @question2 = Question.create(user_id: 2, category: "General", text: "Question 1 for user 2", answer: true)
      @question3 = Question.create(user_id: 2, category: "General", text: "Question 2 for user 2", answer: true)
    end

    it "can generate a list of questions" do
      string_list = Question.generate_list(:count => 2, :excluded_user => 1).inspect
      expect(string_list.is_a? String).to be_true
      expect(string_list.include? @question1.id.to_s).to be_false
      expect(string_list.include? @question2.id.to_s).to be_true
      expect(string_list.include? @question3.id.to_s).to be_true
    end

  end


end
