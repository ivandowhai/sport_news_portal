FactoryBot.define do
  factory :page_category do
    name { Faker::Lorem.word }
    enabled { enabled }
  end
end
