class Page < ApplicationRecord
  CATEGORY_COMPANY_INFO = 'company_info'
  CATEGORY_CONTRIBUTORS = 'contributors'

  def self.categories
    [
      ['Company info', CATEGORY_COMPANY_INFO],
      ['Contributors', CATEGORY_CONTRIBUTORS]
    ]
  end
end
