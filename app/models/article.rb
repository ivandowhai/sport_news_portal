class Article < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader
  before_save :prepare_video_link

  private

  def prepare_video_link
    id = video_link.match(/watch\?v=([\w\-]*)/).captures
    self.video_link = id.nil? ? nil : "https://www.youtube-nocookie.com/embed/#{id.first}"
  end
end
