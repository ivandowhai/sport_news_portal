class Category < ApplicationRecord
  has_many :articles, dependent: :delete_all
  has_many :categories
  has_many :banners
  belongs_to :category, optional: true
  validates :priority, numericality: {only_integer: true}
  scope :enabled, -> { where(enabled: true).order(:priority) }
  scope :first_level, -> { enabled.where(category_id: nil) }
end
