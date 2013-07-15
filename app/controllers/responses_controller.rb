class ResponsesController < ApplicationController

  def create
    @response = Response.new(
      :value => params[:response][:value],
      :game_id => session[:game_id],
      :question_id => params[:response][:question_id]
    )
    @response.save
    redirect_to new_response_path
  end

  def new
    @question_number = session[:question_number] || 0
    @game = Game.find(session[:game_id])
    if @question_number < @game.question_limit 
      @question_number += 1
      session[:question_number] = @question_number
      @question = Question.pick
    else
      session[:game_id] = nil
      session[:question_number] = nil
      render "games/game_over"
    end    
  end

end
