require 'spec_helper'

describe ResponsesController do

  before(:each) do
    @game = Game.create(:user_id => 1, :question_limit => 2, :question_category => 'General')
    session[:user_id] = 1
    session[:game_id] = @game.id
    @question1 = Question.create(:user_id => 1, :text => "a question", :answer => true, :category => "General")
    @question2 = Question.create(:user_id => 1, :text => "a question", :answer => true, :category => "General")
  end

  describe "POST 'create'" do
    context "with valid details" do
      it "redirects to a new response" do
        session[:question_number] = 0
        post 'create', :game_id => @game.id, :response => {:answer => true, :question_id => @question1.id}
        assert_redirected_to new_response_path
      end
    end

    context "question limit is reached" do
      it "redirects to game over page" do
        expect(Response.all.count).to eql 0
        post 'create', :game_id => @game.id, :response => {:answer => true, :question_id => @question1.id}
        post 'create', :game_id => @game.id, :response => {:answer => true, :question_id => @question1.id}
        post 'create', :game_id => @game.id, :response => {:answer => true, :question_id => @question1.id}
        assert_template 'responses/new'
        expect(Response.all.count).to eql 2
      end
    end

    context "when answer is not selected" do
      it "renders the new question page with a message" do
        post 'create', :game_id => @game.id, :response => {:question_id => @question1.id}
        assert_template :new
      end
    end

  end

  describe "GET 'new'" do
    it "returns http success" do
      session[:question_number] = nil
      get 'new'
      response.should be_success
      assert_template :new
    end

    context "when question limit is reached" do
      it "redirects to game over page" do
        session[:question_number] = 2
        get 'new'
        assert_redirected_to game_over_path
      end
    end

  end

end
