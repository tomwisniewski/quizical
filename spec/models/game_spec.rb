require 'spec_helper'

describe Game do

  before(:each) do
    @game = Game.create(:user_id => 1, :question_limit => 2, :question_category => 'General')
  end

  it "knows when a game is over" do
    expect(@game.active_game?(1)).to be_true
    expect(@game.active_game?(2)).to be_false
    expect(@game.active_game?(3)).to be_false
  end

end
