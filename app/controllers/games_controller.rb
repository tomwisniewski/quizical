class GamesController < ApplicationController
  include UsersHelper

  def index
  end

  def create
    available_question_count = Question.where('category = ? and user_id != ?', params[:game][:question_category], current_user_id).count
    if available_question_count < params[:game][:question_limit].to_i
      redirect_to new_game_path, notice: "There are only currently #{available_question_count} questions of the chosen category available. Please choose a lower question limit." 
    else   
      game = Game.new(
        :user_id => current_user_id,
        :question_limit => params[:game][:question_limit],
        :question_category => params[:game][:question_category])
      game.save
      session[:game_id] = game.id
      redirect_to new_response_path
    end
  end

  def new
    @game = Game.new
  end

end
 

