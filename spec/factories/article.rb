FactoryBot.define do
  factory :article do
    category { association :category }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
