class Article < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :delete_all
  mount_uploader :image, ImageUploader
  before_save :prepare_video_link

  def self.search(query)
    where("lower(title) like :query or lower(body) like :query ", query: "%#{query}%")
      .eager_load(:category)
  end

  private

  def prepare_video_link
    return if video_link.nil?
    matches = video_link.match(/watch\?v=([\w\-]*)/)
    unless matches.nil?
      self.video_link = matches.captures.nil? ?
      nil :
      "https://www.youtube-nocookie.com/embed/#{matches.captures.first}"
    end
  end
end
