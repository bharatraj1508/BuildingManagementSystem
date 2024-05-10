class Unit < ApplicationRecord
  belongs_to :building
  has_many :unit_users
  has_many :users, through: :unit_users
end
