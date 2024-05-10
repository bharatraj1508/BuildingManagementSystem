class Building < ApplicationRecord
    has_many :building_users
    has_many :users, through: :building_users
    has_many :units
    
end
