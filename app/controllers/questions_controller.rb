class QuestionsController < ApplicationController

  def index
    @questions = Question.where("user_id = #{session[:user_id]}").load 
  end

  def new

  end

  def create
    q = Question.new()
    q.user_id = session[:user_id]
    q.text = params[:question][:text]
    q.answer = params[:question][:answer]
    q.category = params[:question][:category]
    if q.save
      redirect_to questions_url
    else
      redirect_to "#", notice: q.errors.full_messages
    end
  end

  def show
    @q= Question.find_by(:user_id => session[:user_id], :id => params[:id])
    if @q.nil?
      redirect_to questions_url, notice: "There was a problem with that question. Here are all your questions"  
    end
  end

  def update
  end

  def edit

  end

  def destroy
  d = Question.find_by(:user_id => session[:user_id], :id => params[:id])
  d.destroy #Question.destroy(:user_id => session[:user_id], :id => params[:id])
  redirect_to questions_url, notice: "You have successfully deleted the question "  
  end


end
