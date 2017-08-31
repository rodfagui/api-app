# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "rodfagui", email:"rodfagui@gmail.com", password: "ram242", password_confirmation: "ram242", admin: true)
User.create!(username: "daniel23", email:"daniel23@gmail.com", password: "123456", password_confirmation: "123456", admin: false)

Product.create!(name: "iPhone 7 32Gb", price: 700, quantity: 10)
Product.create!(name: "iPhone 6S 32Gb", price: 500, quantity: 5)
Product.create!(name: "iPhone 6 32Gb", price: 400, quantity: 12)
Product.create!(name: "Sansumg Galaxy S8 32Gb", price: 800, quantity: 8)
Product.create!(name: "One Plus 5 128Gb", price: 600, quantity: 2)
