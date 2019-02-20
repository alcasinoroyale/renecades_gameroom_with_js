class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    if params[:game_id]
      @game = Game.find(params[:game_id])
    else
      @game = Game.first
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    binding.pry
    @review.game_id = @game.id

    if @review.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :game_id, :user_id)
  end
end
