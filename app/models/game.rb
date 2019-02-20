class Game < ApplicationRecord
  has_many :tokens
  has_many :users, through: :tokens
  has_many :reviews, through: :users
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  validates :name, :description, :objective, :number_of_players, :reward_points, :genre, :category_id, presence: true
  scope :all_games, -> { order(name: :asc)}
  scope :order_by_rp, -> { order(reward_points: :desc)}
end
