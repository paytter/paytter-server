class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  before_action :authorized_access_token!

  def authorized_access_token!
    @access_user ||= User.find_by!(access_token: request.env['HTTP_AUTHORIZATION'])
  end

  def access_user
    return if @access_user.blank?
    @access_user
  end
end
