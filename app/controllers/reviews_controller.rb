class ReviewsController < ApplicationController
  def index
    @reviews = @game.reviews
  end
end
