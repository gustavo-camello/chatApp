class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back"
      redirect_to root_path
    else
      flash.now[:error] = "There is something wrong"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = " You succesfully logged out"
    redirect_to root_path
  end

end
