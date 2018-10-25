class Token < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def play_game
    user.reward_points += game.reward_points
    "Thanks for playing #{game.name}!"
  end
end
