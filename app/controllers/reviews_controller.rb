class ReviewsController < ApplicationController

  def index
    @reviews = @game.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.game_id = @game.id

    if @review.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :game_id, :user_id)
  end
end
