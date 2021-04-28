class Category < ApplicationRecord
  has_many :articles, dependent: :delete_all
  has_many :categories
  belongs_to :category, optional: true
  validates :order, numericality: {only_integer: true}
  scope :enabled, -> { where(enabled: true).order(:priority) }
end
