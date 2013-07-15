require 'spec_helper'

describe ResponsesController do

  before(:each) do
    @game = Game.create(:user_id => 1, :question_limit => 2, :question_category => 'General')
    session[:user_id] = 1
    session[:game_id] = @game.id
  end

  describe "POST 'create'" do
    it "redirects to a new response" do
      session[:question_number] = 0
      post 'create', :game_id => @game.id, :response => {:value => true, :question_id => 1}
      response = assigns(:response)
      expect(response.value).to eql true
      expect(response.question_id).to eql 1
      expect(response.game_id).to eql @game.id
      assert_redirected_to new_response_path
    end

    context "question limit is reached" do

      it "redirects to game over page" do
        expect(Response.all.count).to eql 0
        post 'create', :game_id => @game.id, :response => {:value => true, :question_id => 1}
        post 'create', :game_id => @game.id, :response => {:value => true, :question_id => 1}
        post 'create', :game_id => @game.id, :response => {:value => true, :question_id => 1}
        expect(Response.all.count).to eql 2
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

    context "question limit is reached" do
      it "redirects to game over page" do
        session[:question_number] = 2
        get 'new'
        assert_redirected_to game_over_path
      end
    end

  end

end
