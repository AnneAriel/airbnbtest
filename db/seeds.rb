# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts "Creating users..."

user1 = User.create!(email: "aceyrac@gmail.com", password: "toto123", username: "deubla")
user2 = User.create!(email: "alarroze@gmail.com", password: "toto123", username: "nini")
user3 = User.create!(email: "cricri@gmail.com", password: "toto123", username: "cricri")
user4 = User.create!(email: "audie@gmail.com", password: "toto123", username: "audie")
user5 = User.create!(email: "isa@gmail.com", password: "toto123", username: "isa")

puts "Created #{User.count} users"
puts "Creating flats..."
9.times do
  flat = Flat.new(
    name: Faker::Book.genre,
    adress: Faker::Address.full_address,
    description: Faker::Restaurant.description,
    price_per_night: (10..100).to_a.sample,
    number_of_guest: (1..10).to_a.sample,
    user: User.all.sample
  )
  photo = URI.open('https://picsum.photos/200/?bedroom')
  flat.photo.attach(io: photo, filename: 'nes.png', content_type: 'image/png')
  flat.save
end

puts "Created #{Flat.count} flats"
