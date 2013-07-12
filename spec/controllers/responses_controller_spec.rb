require 'spec_helper'

describe ResponsesController do

  describe "GET 'create'" do
    it "returns http success" do
      session[:user_id] = 1
      get 'create', :game_id => 1, :response => {:value => true, :question_id => 1}
      assert_redirected_to new_response_path
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
      assert_template :new
    end
  end

end
