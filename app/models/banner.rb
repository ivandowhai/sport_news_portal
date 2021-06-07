class Banner < ApplicationRecord
  include Statusable
  include AASM

  belongs_to :category
  mount_uploader :image, BannerImageUploader

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :published, :closed

    event :published do
      transitions from: :pending, to: :published
    end

    event :closed do
      transitions from: :published, to: :closed, after: proc { self.closed_at = Time.now.getutc }
    end
  end
end
