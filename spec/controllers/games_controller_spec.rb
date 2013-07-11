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
      expect(Game.all.count).to eql 0
      post 'create'
      expect(Game.all.count).to eql 1
      assert_redirected_to new_response_path
    end
  end

end
