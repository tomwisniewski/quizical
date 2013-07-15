class GamesController < ApplicationController
  include UsersHelper

  def index
  end

  def create
    game = Game.new(
      :user_id => current_user_id,
      :question_limit => params[:game][:question_limit],
      :question_category => params[:game][:question_category])
    game.save
    session[:game_id] = game.id
    redirect_to new_response_path
  end

  def new
    @game = Game.new
  end

end
