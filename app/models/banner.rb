class Banner < ApplicationRecord
  belongs_to :category
  mount_uploader :image, BannerImageUploader
  scope :pending_and_published, -> { where(status: [STATUS_PENDING, STATUS_PUBLISHED]) }
  scope :published, -> { where(status: STATUS_PUBLISHED) }
  scope :closed, -> { where(status: STATUS_CLOSED) }

  STATUS_PENDING = 0
  STATUS_PUBLISHED = 1
  STATUS_CLOSED = 2

  def publish
    self.status = STATUS_PUBLISHED
    save
  end

  def close
    self.status = STATUS_CLOSED
    self.closed = Time.now.getutc
    save
  end
end
