FactoryBot.define do
  factory :survey do
    question { Faker::Lorem.question }
    start_at { Date.today }
    end_at { Date.today + 7.days }
    status { 0 }
  end
end
