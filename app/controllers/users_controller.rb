class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new({
      :username => params[:user][:username],
      :email => params[:user][:email],
      :password => params[:user][:password],
      :password_confirmation => params[:user][:password_confirmation]
    })

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Hello #{@user.username}, welcome to Quizical!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    if params[:user][:password] != ""
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
    end
    if @user.save
      flash[:notice] = "Details updated successfully"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "#{@user.username} deleted."
    @user.destroy
    redirect_to users_path
  end

end
