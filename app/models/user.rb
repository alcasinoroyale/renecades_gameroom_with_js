class User < ApplicationRecord
  has_secure_password
  has_many :tokens
  has_many :games, through: :tokens
  validates :username, :email, :bio, :password, :favorite_game, presence: true
  validates :username, :email, uniqueness: true
end
