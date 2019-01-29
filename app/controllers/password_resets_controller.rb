class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = ["Email sent with password reset instructions"]
      redirect_to root_url
    else
      flash[:error] = ["There is no account associated with that e-mail address"]
      render 'new'
    end
  end

  def edit
    # if the token included in the link is linked to the specified 
    # user's password digest, and the reset_sent_at time is within 
    # the last 2 hours, render the edit page. otherwise, redirect
    # the user to the forgot password page with an error message
    if !valid_user
      flash[:error] = ["Token expired or incorrect"]
      redirect_to new_password_reset_path
    end
  end

  def update
    # binding.pry
    if !valid_user
      flash[:error] = ["Invalid user"]
      redirec_to root_path
    elsif params[:user][:password].empty?
      flash[:error] = ["Password cannot be blank"]
      render 'edit'
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:error] = ["Passwords do not match"]
      render 'edit'
    else
      @user.update_attributes(user_params)
      flash[:success] = ["Password has been successfully reset"]
      redirect_to login_path
    end
    # If all passwords do not match, reject and render the edit page 
    # again (with user and token variables reset so user is 
    # authenticated). Otherwise, if passwords do match, set success 
    # flash message and redirect to login page. 
  end

  private

    def valid_user
      @user = User.find_by(email: params[:email])
      @reset_token = params[:id]
      @user && @user.activated? && @user.authenticated?(:reset, @reset_token) && Time.now - @user.reset_sent_at < 2.hours
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
