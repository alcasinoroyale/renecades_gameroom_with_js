class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render 'new'
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def destroy
    @game.destroy
    redirect_to user_path(current_user)
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :objective, :number_of_players, :reward_points, :genre)
  end
end
