class UsersController < ApplicationController
  before_action :fetch_user, only: [:show, :update, :destroy]
  before_action :fetch_all_users, only: [:index, :show, :update]
  before_action :secure?, only: [:show, :index]

  def show
    
  end


  def index
    fetch_all_users
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to @user
    else
      # Try using materialize 'dialogs' for errors?
      flash[:message] = @user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
       format.html { redirect_to @user, notice: 'User was successfully updated.' }
       format.json { render :json => @user }
       puts "SUCCESS"
      else
        format.html { redirect_to @user, notice: 'Unable to update user.' }
        puts "FAIL"
      end
    end
  end

  private

  def secure?
    if !current_user
      redirect_to new_session_path
    elsif @user.id != current_user.id
      redirect_to current_user
    end
  end

  def fetch_user
    @user = User.find(params[:id])
  end

  def fetch_all_users
    @all_users = User.all
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname, :street, :aptnumber, :city, :state, :zip, :aboutme, :recommandations)
  end
end
