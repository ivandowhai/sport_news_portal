FactoryBot.define do
  factory :page_category do
    name { Faker::Lorem.word }
    enabled { true }

    trait :disabled do
      enabled { false }
    end
  end
end
