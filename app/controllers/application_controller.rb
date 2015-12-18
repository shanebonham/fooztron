class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def authenticate_user!
    redirect_to 'sessions#new' unless current_user
  end

  def set_destination
    session[:destination] = request.url
  end

  def current_user
    @_current_user ||= User.where(uid: session[:uid]).first
  end
end
