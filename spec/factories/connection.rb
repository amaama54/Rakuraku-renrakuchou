FactoryBot.define do
  factory :connection do
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:30) }
  end
  
  factory :year do
    title { Faker::Lorem.characters(number:10) }
  end
end