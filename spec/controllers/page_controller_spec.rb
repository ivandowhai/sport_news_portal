require "rails_helper"

RSpec.describe PagesController, type: :request do
  it "Show one page" do
    create(:page_category)
    site_page = create(:page)
    visit "/pages/" + site_page.slug
    expect(page).to have_content(site_page.name)
    expect(page).to have_content(site_page.body)
  end
end
