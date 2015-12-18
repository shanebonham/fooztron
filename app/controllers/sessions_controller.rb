class SessionsController < ApplicationController
  def new
    redirect_to '/auth/developer'
  end

  def create
    session[:uid] = User.first_or_create_with_uid(auth_hash).uid
    throw 'hi'
    redirect_to games_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
