class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user.authenticate(user_params[:password])
      login!(@user)
      redirect_to @user
    else
      flash[:message] = "Invalid Email or password"
      redirect_to new_session_path
    end

  end

  def destroy
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
