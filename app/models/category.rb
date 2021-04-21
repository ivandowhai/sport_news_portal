class Category < ApplicationRecord
  has_many :articles, dependent: :delete_all
end
