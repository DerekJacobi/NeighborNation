class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to current_user
    else
      new_session_path
    end
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      login!(@user)
      redirect_to @user
    else
      flash[:message] = "Invalid Email or password"
      redirect_to new_session_path
    end

  end

  def destroy
    logout!
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
