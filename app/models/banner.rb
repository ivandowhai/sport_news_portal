class Banner < ApplicationRecord
  belongs_to :category
  mount_uploader :image, BannerImageUploader
  scope :pending_or_published, -> { where(status: [:pending, :published]) }
  scope :published, -> { where(status: :published) }
  scope :closed, -> { where(status: :closed) }

  enum status: {pending: 0, published: 1, closed: 2}

  def publish
    self.published!
    save
  end

  def close
    self.closed!
    self.closed_at = Time.now.getutc
    save
  end
end
