class AchievementsController < ApplicationController
  def index
    @achievement = Achievement.all
  end
end
