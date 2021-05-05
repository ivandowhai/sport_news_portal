FactoryBot.define do
  factory :page do
    page_category_id { page_category.id }
    name { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    enabled { enabled }
    priority { Faker::Number.between(from: 1, to: 10) }
    slug { Faker::Internet.slug(words: name, glue: "-") }
  end
end
