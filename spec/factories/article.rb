FactoryBot.define do
  factory :article do
    category { association :category }
    team { association :team }
    sequence(:title) { |n| Faker::Lorem.sentence + " (#{n})" }
    sequence(:caption) { |n| Faker::Lorem.sentence + " (#{n})" }
    body { Faker::Lorem.paragraph }
    views_count { Faker::Number.number }
    comments_count { Faker::Number.number }
  end
end
