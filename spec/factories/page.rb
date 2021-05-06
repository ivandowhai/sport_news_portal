FactoryBot.define do
  factory :page do
    page_category { association :page_category }
    name { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    enabled { true }
    priority { Faker::Number.between(from: 1, to: 10) }
    slug { Faker::Internet.slug(words: name, glue: "-") }

    trait :disabled do
      enabled { false }
    end
  end
end
