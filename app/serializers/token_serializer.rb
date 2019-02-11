class TokenSerializer < ActiveModel::Serializer
  attributes :user_id, :game_id
  belongs_to :user
  belongs_to :game
end
