class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :objective, :number_of_players, :reward_points, :genre, :category_id, :creator_id
  has_many :tokens
  has_many :users, through: :tokens
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
