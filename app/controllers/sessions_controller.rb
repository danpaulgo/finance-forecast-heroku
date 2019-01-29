class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
    @session = Session.new
  end

  def create
    # binding.pry
    @user = User.find_by(email: params[:session][:email])
    @session = Session.new(session_params)
    if @user.nil?
      flash[:error] = ["No account associated with this e-mail address"]
      redirect_to new_user_path
    elsif !@user.activated
      flash[:error] = ["Please activate your account before logging in"]
      render 'new'
    elsif @user && !!@user.authenticate(params[:session][:password])
      login(@user)
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_to root_path
    else 
      flash[:error] = ["Password is incorrect"]
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

  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end

end
