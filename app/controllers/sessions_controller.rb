class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def new
    redirect_to '/auth/twitter'
  end

  def create
    session[:uid] = User.first_or_create_with_uid(auth_hash).uid
    redirect_to games_path
  end

  def destroy
    session[:uid] = nil
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
