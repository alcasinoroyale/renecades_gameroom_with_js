class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      @user.reward_points = "0"
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "User created successfully!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @users = User.all
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_url
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :favorite_game, :bio, :reward_points)
  end
end
