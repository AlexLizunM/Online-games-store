FactoryBot.define do
  factory :game do
    name { 'Duke Nukem'}
    price { 5000 }
    description { 'good game' }
    cover { Rack::Test::UploadedFile.new('db/picture_for_seed/duke.jpg', 'duke.jpg') }
    screenshots { Rack::Test::UploadedFile.new('db/picture_for_seed/duke.jpg', 'duke.jpg') }
  end
end
