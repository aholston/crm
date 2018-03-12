class UsersController < ApplicationController
  before_action :authenticate

  def index
    puts params
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
  end

  def update
    user = User.find(session[:user_id])
    if user.try(:authenticate, user_val[:password])
      user.update!(user_val)
    else
      flash[:errors] = 'Invalid Password'
    end
    return redirect_to "/sessions/#{user.id}/edit"
  end
end
