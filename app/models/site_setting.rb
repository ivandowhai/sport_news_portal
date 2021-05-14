class SiteSetting < ApplicationRecord
  MOST_POPULAR = :most_popular
  MOST_COMMENTED = :most_commented

  PERIOD_DAY = :day
  PERIOD_WEAK = :weak
  PERIOD_MONTH = :month
  PERIOD_YEAR = :year

  PERIODS = [
    PERIOD_DAY,
    PERIOD_WEAK,
    PERIOD_MONTH,
    PERIOD_YEAR
  ]

  def self.settings_by_keys
    site_settings = all.to_ary
    {
      most_popular: site_settings.find { |model| model.key == SiteSetting::MOST_POPULAR.to_s },
      most_commented: site_settings.find { |setting| setting.key == SiteSetting::MOST_COMMENTED.to_s }
    }
  end
end
