# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  Tag.create!(
    name:Faker::Hipster.word
  )
end

tag_arr = Tag.all

20.times do
  game = Game.create!(
    name:Faker::Game.title,
    price:Faker::Number.within(range: 100..10000),
    description:Faker::ChuckNorris.fact
  )
  tag_arr_curr = tag_arr.to_a
  rand(1..3).times do
    tag_curr = tag_arr_curr.sample
    game.taggings.create!(
      tag:tag_curr
    )
    tag_arr_curr.delete(tag_curr)
  end
  game.cover.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/ss_duke.jpeg'), filename: 'ss_duke.jpeg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/duk.jpeg'), filename: 'duk.jpeg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/dukalis.jpeg'), filename: 'dukalis.jpeg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/duke_gun.jpg'), filename: 'duke_gun.jpg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/dukk.jpeg'), filename: 'dukk.jpeg')
  game.screenshots.attach(io: File.open('db/picture_for_seed/duuk.jpg'), filename: 'duuk.jpg')
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
