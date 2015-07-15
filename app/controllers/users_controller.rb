class UsersController < ApplicationController
  def create
    @user = User.new()
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :street, :aptnumber, :city, :state, :zip)
  end

end
