class TokensController < ApplicationController
    def new
      @token = Token.new
    end

    def create
      @token = Token.create(token_params)
      flash[:message] = @token.play_game
      redirect_to user_path(@token.user)
    end

    private

    def token_params
      params.require(:token).permit(:user_id, :game_id)
  end
end
