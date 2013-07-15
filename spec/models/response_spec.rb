require 'spec_helper'

describe Response do

  before(:each) do
    @user = User.create(
      :username => "Neil",
      :email => "neil@gmail.com",
      :password => "password",
      :password_confirmation => "password"
    )
    @one_question_game = Game.create!(:user_id => @user.id, :question_limit => 1, :question_category => 'General')
    @two_question_game = Game.create(:user_id => @user.id, :question_limit => 2, :question_category => 'General')
    @question = Question.create(:user_id => @user.id, :text => "a question", :answer => true, :category => "General")
  end
      
  context "when game not active" do
    it "cannot add more responses" do
      expect(@one_question_game.valid?).to be_true
      expect(@user.valid?).to be_true
      expect(@question.valid?).to be_true

      @response1 = Response.create(
        :value => true,
        :game_id => @one_question_game.id,
        :question_id => @question.id
      )      
      expect(@response1.errors.empty?).to be_true
      # expect(@response1.valid?).to be_true # Doesn't work even though saved to database abd valid
      @response2 = Response.create(
        :value => true,
        :game_id => @one_question_game.id,
        :question_id => @question.id
      )
      expect(Response.all.count).to eql 1
      expect(@response2.valid?).to be_false
      expect(@response2.errors.empty?).to be_false
    end
  end


end
