# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Assuming the models are User, Building, and MovieGenre as inferred from the context provided

# Generate Users
10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password', # Assuming a default password for seed data
    password_confirmation: 'password'
  )
end

# Generate Buildings
5.times do
  Building.create!(
    name: Faker::Address.community,
    address: Faker::Address.full_address
  )
end


puts "Seed data generated successfully!"
