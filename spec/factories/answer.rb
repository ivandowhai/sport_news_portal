FactoryBot.define do
  factory :answer do
    answer { Faker::Lorem.word }
    survey { relation :survey }
  end
end
