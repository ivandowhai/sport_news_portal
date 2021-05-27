class SiteSetting < ApplicationRecord
  MOST_POPULAR = :most_popular
  MOST_COMMENTED = :most_commented
  NEWSLETTERS_SUBSCRIPTION = :newsletter_subscription

  PERIOD_DAY = :day
  PERIOD_WEEK = :week
  PERIOD_MONTH = :month
  PERIOD_YEAR = :year

  PERIODS = [
    PERIOD_DAY,
    PERIOD_WEEK,
    PERIOD_MONTH,
    PERIOD_YEAR
  ]

  def self.newsletter_subscription
    where(key: NEWSLETTERS_SUBSCRIPTION)
  end
end
