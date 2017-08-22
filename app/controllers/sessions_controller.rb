class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
