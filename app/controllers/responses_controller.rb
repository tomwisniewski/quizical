class ResponsesController < ApplicationController

  def create
    @question_errors = []
    @answer = params[:response][:answer]
    @question = Question.find(params[:response][:question_id])
    if @answer.nil? || @answer == ''
      @question_errors << "Select an answer"
      render :new
    else
      @response = Response.new(
        :value => @answer,
        :game_id => session[:game_id],
        :question_id => @question.id)
      if @response.save
        redirect_to new_response_path
      else
        @question_errors << @response.errors.full_messages
        render :new
      end
    end
  end


  def new
    @question_errors = []
    @question_number = session[:question_number] || 0
    @game = Game.find(session[:game_id]) if session[:game_id]
    if @game && @question_number < @game.question_limit 
      @question_number += 1
      session[:question_number] = @question_number
      @question = Question.pick
    else
      session[:game_id] = nil
      session[:question_number] = nil
      redirect_to game_over_path
    end    
  end

end
