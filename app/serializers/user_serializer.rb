class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :favorite_game, :ranks, :reward_points
end
