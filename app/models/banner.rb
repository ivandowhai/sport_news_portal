class Banner < ApplicationRecord
  include Statusable

  belongs_to :category
  mount_uploader :image, BannerImageUploader

  def close
    self.status = STATUS_CLOSED
    self.closed = Time.now.getutc
    save
  end
end
