# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
User.destroy_all
Plant.destroy_all

puts 'Creating users...'

users_attributes = []

10.times do
  users_attributes << {
                        email: Faker::Internet.email,
                        password: Faker::Internet.password(8),
                      }
end

users_attributes.each do |user_hash|
  User.create!(user_hash)
end

puts 'Creating plants...'

plants_attributes = []

User.all.each do |user|
  2.times do
    plants_attributes << {
                          name: Faker::Food.vegetables,
                          description: Faker::Lorem.paragraph,
                          user_id: user.id
                        }
  end
end

plants_attributes.each do |plant_hash|
  Plant.create!(plant_hash)
end

puts 'Finished!'
