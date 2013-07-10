class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:login_email])
    if @user && @user.authenticate(params[:session][:login_password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back, #{@user.username}!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Password and/or email incorrect."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end
end
