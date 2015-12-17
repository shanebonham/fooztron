class SessionsController < ApplicationController
  def new
    redirect_to '/auth/developer'
  end

  def create
    throw 'hi'
  end
end