class ResponsesController < ApplicationController

  def create
    @response = Response.new(
      :value => params[:response][:value],
      :game_id => session[:game_id],
      :question_id => session[:question_number]
    )
    @response.save
    redirect_to new_response_path
  end

  def new
    @game_id = session[:game_id]
    @question_number = session[:question_number] || 0
    @question_number += 1
    session[:question_number] = @question_number
    @question = Question.pick
  end

end
