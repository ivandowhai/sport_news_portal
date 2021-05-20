FactoryBot.define do
  factory :site_setting do
    key { "most_popular" }
    parameters { {enabled: true, period: "day"} }
  end

  trait :most_popular do
    key { "most_popular" }
  end

  trait :most_commented do
    key { "most_commented" }
  end

  trait :disabled do
    parameters { {enabled: false, period: "day"} }
  end
end
