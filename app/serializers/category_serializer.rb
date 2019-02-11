class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :games
  has_many :users, through: :games
end
