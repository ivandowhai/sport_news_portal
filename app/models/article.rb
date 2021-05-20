class Article < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :delete_all
  has_many :article_views, dependent: :delete_all
  mount_uploader :image, ImageUploader
  before_save :prepare_video_link
  scope :most_popular, -> { order(views_count: :desc).limit(3) }
  scope :most_commented, -> { order(comments_count: :desc).limit(3) }


  def self.search(query)
    where("lower(title) like :query or lower(body) like :query ", query: "%#{query}%")
      .eager_load(:category)
  end

  def self.reset_views(article_ids)
    if article_ids.empty?
      update_all(views_count: 0)
    else
      where.not(id: article_ids).update_all(views_count: 0)
    end
  end

  def self.reset_comments(article_ids)
    if article_ids.empty?
      update_all(comments_count: 0)
    else
      where.not(id: article_ids).update_all(comments_count: 0)
    end
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
