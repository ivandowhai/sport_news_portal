class Locale < ApplicationRecord
  scope :enabled, -> { where(enabled: true) }

  DEFAULT_LANGUAGE = "en"

  def enable
    self.enabled = true
    save
  end

  def disable
    self.enabled = false
    save
  end

  def is_default?
    code == DEFAULT_LANGUAGE
  end
end
