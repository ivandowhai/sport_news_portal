FactoryBot.define do
  factory :page_category do
    name { Faker::Lorem.word }
    enabled { true }
  end
end
