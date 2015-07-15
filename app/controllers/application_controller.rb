class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private
  def login!(user)
    session[:current_user_id] = user.id
  end

  def logout!
    session[:current_user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
end
