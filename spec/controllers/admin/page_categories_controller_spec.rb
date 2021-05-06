require "rails_helper"

RSpec.describe Admin::PageCategoriesController, type: :request do
  context "Page Category" do
    let(:user) { create(:user) }

    it "Disable" do
      sign_in user
      page_category = create(:page_category, enabled: true)
      put "/admin/page_category/disable/#{page_category.id}", xhr: true

      expect(page_category.reload.enabled).to eq false
    end

    it "Enable" do
      sign_in user
      page_category = create(:page_category, enabled: false)
      put "/admin/page_category/enable/#{page_category.id}", xhr: true

      expect(page_category.reload.enabled).to eq true
    end
  end
end
