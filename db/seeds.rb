# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  game = Game.create!(
    name:Faker::Game.title,
    price:Faker::Number.within(range: 100..10000),
    description:Faker::Game.genre
  )
  game.cover.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/ss_duke.jpeg'), filename: 'ss_duke.jpeg')
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
