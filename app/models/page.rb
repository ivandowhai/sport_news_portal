class Page < ApplicationRecord
  belongs_to :page_category, class_name: 'PageCategory', foreign_key: 'page_categories_id'

  CATEGORY_COMPANY_INFO = 'company_info'
  CATEGORY_CONTRIBUTORS = 'contributors'

  DELETE_FORBIDDEN = [
    'about-sports-hub',
    'contact-us',
    'privacy-policy',
    'terms-and-conditions'
  ]

  def self.categories
    [CATEGORY_COMPANY_INFO, CATEGORY_CONTRIBUTORS]
  end

  def self.categories_for_select
    [
      ['Company info', CATEGORY_COMPANY_INFO],
      ['Contributors', CATEGORY_CONTRIBUTORS]
    ]
  end

  def can_delete?
    DELETE_FORBIDDEN.include?(slug) == false
  end

  private

  def self.sort_by_category(pages)
    output = {}
    self.categories.each do |category|
      output[category] = pages.select { |page| page.category == category }
    end
    output
  end
end
