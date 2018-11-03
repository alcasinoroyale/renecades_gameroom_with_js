class GamesController < ApplicationController
  def index
    @games = Game.all
    all_games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.creator = current_user
    @game.save
    flash[:message] = "#{@game.name} has been created successfully!"
    redirect_to game_path(@game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

  def show
    @game = Game.find(params[:id])
    @current_user = current_user
    @token = @game.tokens.build(user_id:current_user.id)
  end

  def destroy
    @game.destroy
    redirect_to user_path(current_user)
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :objective, :number_of_players, :reward_points, :creator_id, :genre, :category_id)
  end
end
