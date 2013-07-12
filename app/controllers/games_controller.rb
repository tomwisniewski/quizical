class GamesController < ApplicationController
  
  def index
  end

  def create
    game = Game.new
    game.save
    session[:game_id] = game.id
    redirect_to new_response_path
  end

  def new
  end

end
