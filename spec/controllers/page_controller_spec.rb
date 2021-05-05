require "rails_helper"

RSpec.describe PagesController, type: :request do
  context "Pages" do
    it "Show one page" do
      page_category = create(:page_category, enabled: true)
      site_page = create(:page, page_category: page_category, enabled: true)
      visit "/pages/" + site_page.slug
      expect(page).to have_content(site_page.name)
      expect(page).to have_content(site_page.body)
    end
  end
end
