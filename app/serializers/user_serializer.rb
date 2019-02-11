class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :favorite_game, :ranks, :reward_points
  has_many :tokens
  has_many :games, through: :tokens
  has_many :created_games, class_name: "Game", foreign_key: "creator_id"
  has_many :categories, through: :created_games
end
