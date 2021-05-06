FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    enabled { true }
    priority { 1 }
  end
end
