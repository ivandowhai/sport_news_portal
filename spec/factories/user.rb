FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    role { "admin" }
    password { Faker::Internet.password(min_length: 10) }
  end
end
