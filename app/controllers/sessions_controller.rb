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
         flash[:message] = "Welcome Back to Renecades, #{@user.username}!"
         redirect_to user_path(@user)
       else
         flash[:message] = "The username or password that you entered is incorrect."
         redirect_to 'welcome/home'
      end
  end

  def destroy
    session.destroy
    redirect_to root_url
  end
end
