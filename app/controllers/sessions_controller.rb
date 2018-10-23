class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to user_path(@current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(username: params[:user][:username])
       if @user && @user.authenticate(params[:user][:password])
         session[:user_id] = @user.id
         redirect_to user_path(@user)
       else
         redirect_to 'welcome/home'
      end
  end

  def destroy
    session.destroy
    redirect_to root_url
  end
end
