class Game < ApplicationRecord
  has_many :tokens
  has_many :users, through: :tokens
  has_many :achievements
  belongs_to :category
  validates :name, :description, :objective, :number_of_players, :reward_points, :genre, :category_id, presence: true
end
