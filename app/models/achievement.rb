class Achievement < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def earn_achievement
    #if user has #{integer} reward points
    #puts "You have earned the title of #{achievement.name}"
    #add achievement.name to User's Profile as their rank.
    #if you reach next achievement level, change rank
  end
end
