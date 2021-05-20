class SiteSetting < ApplicationRecord
  MOST_POPULAR = :most_popular
  MOST_COMMENTED = :most_commented

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
end
