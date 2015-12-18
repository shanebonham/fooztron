class SessionsController < ApplicationController
  def new
    redirect_to '/auth/developer'
  end

  def create
    session[:user_id] = User.first_or_create_with_uid(auth_hash)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end