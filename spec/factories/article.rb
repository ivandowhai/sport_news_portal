FactoryBot.define do
  factory :article do
    category_id { category.id }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
