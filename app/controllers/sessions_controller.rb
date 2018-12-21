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
         redirect_to '/login'
      end
  end

  def facebook
    @user = User.find_or_create_by!(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.favorite_game = "Candy Crush"
      u.bio = "Loves Playing Games"
      u.reward_points = "0"
      u.password = 'password'
    end
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
   end

  def destroy
    session.destroy
    redirect_to root_url
  end

  private
    def auth
      request.env['omniauth.auth']
    end
  end
