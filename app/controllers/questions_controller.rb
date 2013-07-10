class QuestionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    q = Question.new
    q.user_id = session[:user_id]
    q.text = params[:question][:text]
    q.answer = params[:question][:answer]
    q.category = params[:question][:category]

  end

  def show
  end

  def update
  end

  def edit
  end


end
