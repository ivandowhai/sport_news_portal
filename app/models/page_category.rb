class PageCategory < ApplicationRecord
  has_many :page

  def slug
    name.downcase.tr(" ", "-")
  end
end
