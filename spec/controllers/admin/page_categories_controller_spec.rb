require "rails_helper"

RSpec.describe Admin::PageCategoriesController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }

    it "Disable" do
      page_category = create(:page_category)
      put "/admin/page_category/disable/#{page_category.id}", xhr: true

      expect(page_category.reload.enabled).to eq false
    end

    it "Enable" do
      page_category = create(:page_category, :disabled)
      put "/admin/page_category/enable/#{page_category.id}", xhr: true

      expect(page_category.reload.enabled).to eq true
    end
  end
end
