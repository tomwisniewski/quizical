class UsersController < ApplicationController

  def index
  end

  def new  

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
  end

  def update
  end

  def edit
  end

  def destroy
  
  end

end
