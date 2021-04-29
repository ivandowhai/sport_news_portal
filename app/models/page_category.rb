class PageCategory < ApplicationRecord
  has_many :pages
  scope :enabled, -> { where(enabled: true).order("id") }

  def slug
    name.downcase.tr(" ", "-")
  end

  def enable
    self.enabled = true
    save
  end

  def disable
    self.enabled = false
    save
  end
end
