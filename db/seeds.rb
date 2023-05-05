# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'abc@gmail.com', password: 'abc', password_confirmation: 'abc', role: 'member')

User.create(email: 'xyz@gmail.com', password: 'xyz', password_confirmation: 'xyz', role: 'member')

User.create(email: '123@gmail.com', password: '123', password_confirmation: '123', role: 'member')

User.create(email: 'trainer01@gmail.com', password: 't01', password_confirmation: 't01', role: 'trainer')

