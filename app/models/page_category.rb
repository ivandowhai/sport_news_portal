class PageCategory < ApplicationRecord
  has_many :pages
  scope :enabled, -> { where(enabled: true).order("id") }

  def slug
    name.downcase.tr(" ", "-")
  end

  def enable
    self.enabled = true
    self.save
  end

  def disable
    self.enabled = false
    self.save
  end
end
