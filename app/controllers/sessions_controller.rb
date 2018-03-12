class SessionsController < ApplicationController
  def index
    redirect_to '/dashboard' unless !session[:user_id]
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    if User.find_by_username(user_val[:username]).try(:authenticate, user_val[:password])
      user = User.find_by_username(user_val[:username])
      session[:user_id] = user.id
      return redirect_to '/redirect'
    else
      flash[:errors] = 'Invalid Combination'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
