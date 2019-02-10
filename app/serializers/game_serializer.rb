class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :objective, :number_of_players, :reward_points, :genre, :category_id
end
