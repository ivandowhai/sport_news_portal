class Page < ApplicationRecord
  CATEGORY_COMPANY_INFO = 'company_info'
  CATEGORY_CONTRIBUTORS = 'contributors'

  def self.categories
    [CATEGORY_COMPANY_INFO, CATEGORY_CONTRIBUTORS]
  end

  def self.categories_for_select
    [
      ['Company info', CATEGORY_COMPANY_INFO],
      ['Contributors', CATEGORY_CONTRIBUTORS]
    ]
  end

  def self.get_all_by_categories
    self.sort_by_category(self.all)
  end

  def self.get_enabled_by_categories
    self.sort_by_category(self.where('enabled = %s', true))
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
