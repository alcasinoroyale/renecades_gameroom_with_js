class Game < ApplicationRecord
  has_many :users, through: :tokens
  has_many :achievements
  belongs_to :category
end
