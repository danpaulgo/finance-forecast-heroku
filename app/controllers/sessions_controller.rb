class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
    # binding.pry
    @user = User.find_by(email: params[:session][:email])
    if !@user.activated
      flash[:error] = ["Please activate your account before logging in"]
      render 'new'
    elsif @user && !!@user.authenticate(params[:session][:password])
      login(@user)
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_to root_path
    else 
      flash[:error] = ["Incorrect email/password"]
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def invalid
    redirect_to root_path
  end

end
