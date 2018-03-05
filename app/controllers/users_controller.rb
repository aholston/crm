class UsersController < ApplicationController
  before_action :authenticate

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
  end
end
