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
pics_arr = ['db/picture_for_seed/duke.jpg', 'db/picture_for_seed/ss_duke.jpeg', 'db/picture_for_seed/duk.jpeg',
  'db/picture_for_seed/dukalis.jpeg', 'db/picture_for_seed/duke_gun.jpg',
  'db/picture_for_seed/dukk.jpeg', 'db/picture_for_seed/duuk.jpg']

30.times do
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

  game.cover.attach(io: File.open(pics_arr.sample), filename: 'cover.jpg')

  pics_arr_curr = pics_arr.clone

  rand(5..7).times do
    pic_curr = pics_arr_curr.sample
    game.screenshots.attach(io: File.open(pic_curr), filename: File.basename(pic_curr))
    pics_arr_curr.delete(pic_curr)
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
