FactoryBot.define do
  name = Faker::Lorem.word
  factory :page do
    page_category_id { page_category.id }
    name { name }
    body { Faker::Lorem.paragraph }
    enabled { true }
    priority { Faker::Number.between(from: 1, to: 10) }
    slug { Faker::Internet.slug(name, glue: "-") }
  end
end
