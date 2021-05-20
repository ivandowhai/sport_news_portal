FactoryBot.define do
  factory :category do
    sequence(:name) { |n| Faker::Lorem.word + " (#{n})" }
    enabled { true }
    priority { 1 }
  end
end
