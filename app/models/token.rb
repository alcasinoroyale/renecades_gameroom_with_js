class Token < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def play_game
    @user = current_user
    "Thanks for playing #{game.name}!"
  end
end
