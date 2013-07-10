class QuestionsController < ApplicationController

  def index
    @questions = Question.find_by_user_id(session[:user_id])
  end

  def new

  end

  def create
    q = Question.new
    q.user_id = session[:user_id]
    q.text = params[:question][:text]
    q.answer = params[:question][:answer]
    q.category = params[:question][:category]
    if q.valid?
      q.save
      redirect_to "questions#index"
    else
      redirect_to "#", notice: q.valid?.errors.full_messages
    end
  end

  def show
    @questions = Question.find_by_user_id(session[:user_id])
  end

  def update
  end

  def edit
  end


end
