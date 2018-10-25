class Token < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def play_game
    if @current_user
    user.reward_points += game.reward_points
    user.save
    puts "Thanks for playing #{game.name}!"
    end
  end
end
