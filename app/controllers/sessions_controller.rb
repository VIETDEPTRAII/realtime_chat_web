class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      session[:current_user_id] = user.id
      flash[:success] = 'You have logged in successfully'
      redirect_to root_path
    else
      flash.now[:error] = 'You have logged in failed!'
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash[:success] = 'You have logged out successfully'
    redirect_to login_path
  end
end
