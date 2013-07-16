require 'spec_helper'

describe GamesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
      assert_template 'games/index'
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
      assert_template 'games/new'
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      Question.create(:user_id => 1, :category => 'General', :text => 'Some text', :answer => false)
      Question.create(:user_id => 1, :category => 'General', :text => 'Some text', :answer => false)
      session[:user_id] = 2
      expect(Game.all.count).to eql 0
      session[:game_id] = 2
      post 'create', :game => {:question_limit => 2, :question_category => "General"}
      expect(Game.all.count).to eql 1
      expect(Game.first.question_limit).to eql 2
      expect(Game.first.question_category).to eql "General"
      assert_redirected_to new_response_path
    end
  end

  describe "GET 'game_over" do
    it "renders the game_over page" do
      get 'game_over'
      assert_template 'games/game_over'
    end
  end

end
