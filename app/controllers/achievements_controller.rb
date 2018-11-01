class AchievementsController < ApplicationController
  def index
    @achievement = Achievement.all
    all_users
  end
end
