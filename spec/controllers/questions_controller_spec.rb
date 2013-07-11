require 'spec_helper'


describe QuestionsController do

  describe "GET 'show'" do
    it "returns http success" do
      session[:user_id] = 4
      Question.create(user_id: 4, category: "Food & Wine", text: "A brie is a type of cheese", answer: true)
      id = Question.last.id
      get 'show', id: id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id  => 1
      response.should be_success
    end
  end
end
