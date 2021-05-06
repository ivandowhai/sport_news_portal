require "rails_helper"

RSpec.describe Admin::PagesController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }
    let(:page_category) { create(:page_category) }
    let(:pages) { create_list(:page, 2, page_category: page_category) }
    let(:page_categories) { create_list(:page_category, 2) }
    let(:site_page) { create(:page) }

    it "Pages list" do
      pages
      visit admin_pages_path

      pages.each do |site_page|
        expect(page).to have_content(site_page.name)
      end
    end

    it "Should create new page" do
      pending("I don't know how to select hidden field")
      pages
      visit admin_pages_path

      click_button "Add footer page"

      fill_in "page[name]", with: "New page"
      fill_in "page[page_categories_id]", with: page_category.id

      expect { click_button "Add" }.to change(Page, :count).by(1)
    end

    it "Should update an existing page" do
      site_page = create(:page, page_category: page_categories[0])
      visit edit_admin_page_path(site_page)

      fill_in "page[name]", with: "Updated page"
      fill_in "page[body]", with: "Updated page content"
      fill_in "page[priority]", with: 5
      select page_categories[1].name, from: "page[page_category_id]"

      click_button "Update Page"

      expect(site_page.reload.name).to eq "Updated page"
      expect(site_page.body).to eq "Updated page content"
      expect(site_page.priority).to eq 5
      expect(site_page.page_category.name).to eq page_categories[1].name
    end

    it "Disable" do
      put "/admin/pages/disable/#{site_page.id}", xhr: true

      expect(site_page.reload.enabled).to eq false
    end

    it "Enable" do
      site_page = create(:page, :disabled)

      put "/admin/pages/enable/#{site_page.id}", xhr: true

      expect(site_page.reload.enabled).to eq true
    end

    it "Should delete page" do
      pages
      visit admin_pages_path

      expect { find("a[href='/admin/pages/#{pages[0].id}']").click }.to change(Page, :count).by(-1)
    end
  end
end
