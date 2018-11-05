class User < ApplicationRecord
  has_secure_password
  has_many :tokens
  has_many :games, through: :tokens
  has_many :games, class_name: "Game", foreign_key: "creator_id"

  validates :username, :email, :bio, :favorite_game, :reward_points, presence: true
  validates :username, :email, uniqueness: true
  validates :password, presence: true, allow_nil: true

  def rank
    if self.reward_points.between? 0, 100
      self.rank = "Novice"
    elsif self.reward_points.between? 100, 300
      self.rank = "Apprentice"
    elsif self.reward_points.between? 300, 600
      self.rank = "Game Enthusiast"
    elsif self.reward_points.between? 600, 1000
      self.rank = "Game Crusher"
    elsif self.reward_points.between? 1000, 1500
      self.rank = "Strategy Master"
    elsif self.reward_points.between? 1500, 2100
      self.rank = "King of Renecades"
    end
  end
end
