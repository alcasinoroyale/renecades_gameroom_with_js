class User < ApplicationRecord
  has_secure_password
  has_many :tokens
  has_many :games, through: :tokens
end
