require "rails_helper"

RSpec.describe Page, type: :model do
  describe "associations" do
    it { should belong_to(:page_category).class_name(PageCategory) }
  end
end
