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
    price:Faker::Number.within(range: 100..10000)
  )
  game.cover.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

game = Game.create!(name: 'Skyrim', price: 999999, description: "Voobcshe axrenitelnaya igra bazary net no dolbanii Todd Govard gde 6 igra?")
game.cover.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
game.screenshots.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
game.screenshots.attach(io: File.open('db/picture_for_seed/ss_duke.jpeg'), filename: 'ss_duke.jpeg')
