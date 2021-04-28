class Page < ApplicationRecord
  belongs_to :page_category
  before_save :add_slug
  scope :enabled, -> { where(enabled: true).order('"order"') }

  DELETE_FORBIDDEN = [
    "about-sports-hub",
    "contact-us",
    "privacy-policy",
    "terms-and-conditions"
  ]

  def can_delete?
    DELETE_FORBIDDEN.include?(slug) == false
  end

  def enable
    self.enabled = true
    self.save
  end

  def disable
    self.enabled = false
    self.save
  end

  private

  def add_slug
    self.slug = name.downcase.tr(" ", "-").tr("/", "")
  end
end
