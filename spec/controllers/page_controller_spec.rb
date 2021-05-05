require "rails_helper"

RSpec.describe PagesController, type: :request do
  context "Pages" do
    it "Show one page" do
      page_category = create(:page_category)
      site_page = create(:page, page_category: page_category)
      visit "/pages/" + site_page.slug
      page.should have_content(site_page.name)
      page.should have_content(site_page.body)
    end
  end
end
