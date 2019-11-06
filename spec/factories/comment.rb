FactoryBot.define do
  factory :comment do
    content { 'Good Game'}
    rating { 5 }
    user
    game
  end
end
