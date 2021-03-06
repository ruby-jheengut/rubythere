class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.env == 'production'
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    rescue_from ActionController::RoutingError, :with => :record_not_found
  end

  private

  def record_not_found
    flash[:error] = 'Sorry, the page you requested was not found.' if flash.empty?
    if signed_in?
      redirect_to account_url
    else
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate
    if !signed_in?
      deny_access
    end
  end

  def authenticate_for_admin
    deny_access unless signed_in? && current_user.admin?
  end

  def deny_access
    redirect_to '/auth/twitter'
  end

  def signed_in?
    !current_user.nil?
  end
end
