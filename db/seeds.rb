# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

t01 = User.create(email: 't01@gmail.com', password: 't01', password_confirmation: 't01', role: 'trainer')

t02 = User.create(email: 't02@gmail.com', password: 't02', password_confirmation: 't02', role: 'trainer')

User.create(email: 'abc@gmail.com', password: 'abc', password_confirmation: 'abc', role: 'member', trainer_id: t01.id)

User.create(email: 'xyz@gmail.com', password: 'xyz', password_confirmation: 'xyz', role: 'member', trainer_id: t01.id)

User.create(email: '123@gmail.com', password: '123', password_confirmation: '123', role: 'member', trainer_id: t02.id)

User.create(email: 'admin@gmail.com', password: 'admin', password_confirmation: 'admin', role: 'admin')
