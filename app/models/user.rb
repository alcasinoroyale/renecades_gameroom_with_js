class User < ApplicationRecord
  has_secure_password
  has_many :tokens
  has_many :games, through: :tokens
  has_many :games, class_name: "Game", foreign_key: "creator_id"

  validates :username, :email, :bio, :favorite_game, :reward_points, presence: true
  validates :username, :email, uniqueness: true
  validates :password, presence: true, allow_nil: true
end
