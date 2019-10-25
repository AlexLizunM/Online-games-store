FactoryBot.define do
  factory :user do
    nickname { 'Duke Nukem'}
    email { 'deusvult@gmail.com' }
    password { 'qwerty' }
    trait :confirmed do
      confirmed_at { '25.10.2019' }
    end
  end
end
