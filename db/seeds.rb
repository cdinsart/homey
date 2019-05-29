# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
DeskFeature.destroy_all
Feature.destroy_all
Photo.destroy_all
Desk.destroy_all
User.destroy_all
city = ['Barcelona', 'London', 'Berlin', 'Paris']
puts "starting the seed"
user1 = User.create!(first_name: 'claire', last_name: 'dinsart', email:'claire@gmail.com', password: 'password')
user2 = User.create!(first_name: 'florin', last_name: 'diconescu', email:'florin@gmail.com', password: 'password')
user3 = User.create!(first_name: 'david', last_name: 'soutoul', email:'david@gmail.com', password: 'password')

#Desk.create!(title: 'Spacious desk in Gracia', price: 30, address: city.sample, description "Amazing desk to work when you need privacy. Please don't smoke in the kitchen.", user: user1)
#Desk.create!(title: 'Desk in LeWagon', price: 20, address: city.sample, description "Cozy desk next to the best future developers. Don't sit next to Jackson", user: user2)
#Desk.create!(title: 'Luxury desk in Sagrada Familia', price: 80, address: city.sample, description "Nice desk in the city center. You can work and pray!", user: user1)

Feature.create!(name: 'Wifi', icon_name: "Wifi")
Feature.create!(name: 'Coffee', icon_name: "Coffee")
Feature.create!(name: 'Printer', icon_name: "Printer")
Feature.create!(name: 'Heater & A/C', icon_name: "Heater")
Feature.create!(name: 'Kitchen', icon_name: "Kitchen")
Feature.create!(name: 'Living Room', icon_name: "Livingroom")
Feature.create!(name: 'Television', icon_name: "Television")
Feature.create!(name: 'Adaptors', icon_name: "Adaptor")
Feature.create!(name: 'Table light', icon_name: "Lamp")
Feature.create!(name: 'Pen & Paper', icon_name: "Pen")
puts "finished the seed"
