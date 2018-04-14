class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:notice] = 'Email sent with password reset instructions'
    redirect_to '/'
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 1.hours.ago
      flash[:errors] = 'Password reset has expired!'
      return redirect_to '/password_resets/new'
    elsif params[:password_confirmation] == params[:password]
      puts "Password1: #{@user.password}"
      @user.update(user_val)
      puts "Password2: #{@user.password_digest}"
      return redirect_to '/dashboard'
    else
      flash[:errors] = 'Something went wrong, please try again'
      return redirect_to '/'
    end


  end
end
