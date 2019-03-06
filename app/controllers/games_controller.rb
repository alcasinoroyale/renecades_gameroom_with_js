class GamesController < ApplicationController
  def index
    @games = Game.all
    if(params[:order_by]=="Alphabetical")
      @games = Game.all_games
    elsif(params[:order_by]=="Reward Points")
      @games = Game.order_by_rp
    end
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @games}
    end
  end

  def new
    @game = Game.new
    if params[:category_id]
      @category = Category.find(params[:category_id])
    else
      @category = Category.first
    end
  end

  def create
    @game = Game.new(game_params)
    @game.creator = current_user
    if @game.save
      flash[:message] = "#{@game.name} has been created successfully!"
      respond_to do |f|
        f.html {redirect_to game_path(@game)}
        f.json {render :json => @game}
        binding.pry
      end
    else
      render 'new'
    end
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
      respond_to do |format|
        format.html {render :show}
        format.json {render json: @game}
      end
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
