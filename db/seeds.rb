# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Feature.destroy_all
puts "starting the seed"
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
