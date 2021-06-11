FactoryBot.define do
  factory :locale do
    code { Faker::Lorem.characters(number: 2) }
    enabled { false }
  end
end
