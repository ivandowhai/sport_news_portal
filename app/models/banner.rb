class Banner < ApplicationRecord
  include Statusable

  belongs_to :category
  mount_uploader :image, BannerImageUploader

  def close
    self.closed!
    self.closed_at = Time.now.getutc
    save
  end
end
