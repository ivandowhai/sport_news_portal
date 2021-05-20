FactoryBot.define do
  factory :page_category do
    sequence(:name) { |n| Faker::Lorem.word + " (#{n})" }
    enabled { true }

    trait :disabled do
      enabled { false }
    end
  end
end
