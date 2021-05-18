FactoryBot.define do
  factory :site_setting do
    key { "most_popular" }
    settings { {enabled: true, period: "day"} }
  end

  trait :most_popular do
    key { "most_popular" }
  end

  trait :most_commented do
    key { "most_commented" }
  end

  trait :disabled do
    settings { {enabled: false, period: "day"} }
  end
end
