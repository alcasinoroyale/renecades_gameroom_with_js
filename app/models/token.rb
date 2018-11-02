class Token < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def play_game
    new_reward_points = self.user.reward_points + self.game.reward_points
    self.user.update(
      :reward_points => new_reward_points
    )
    #binding.pry
    user.save
    "Thanks for playing #{self.game.name}! You have earned #{self.game.reward_points} Reward Points!"
  end
end
