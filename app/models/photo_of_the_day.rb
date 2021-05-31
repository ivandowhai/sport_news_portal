class PhotoOfTheDay < ApplicationRecord
  mount_uploader :picture, PhotoOfTheDayUploader
  validates :picture, presence: true
  validates :alt, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
end
