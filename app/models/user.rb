class User < ApplicationRecord
  has_secure_password
  has_many :tokens
  has_many :games, through: :tokens
  validates :username, :email, :bio, :favorite_game, :reward_points, presence: true
  validates :username, :email, uniqueness: true
  validates :password, presence: true, allow_nil: true
end
