class ResponsesController < ApplicationController

  def create
    @response = Response.new(
      :game_id => params[:response][:game_id],
      :value => params[:response][:value],
      :question_id => params[:response][:question_id]
    )
    @response.save
    session[:question_number] += 1
    redirect_to responses_new_path
  end

  def new
    @game_id = session[:game_id]
    @question_number = session[:question_number]
    @question = Question.pick
  end

end
