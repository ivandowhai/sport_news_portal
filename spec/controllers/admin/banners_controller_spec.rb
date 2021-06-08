require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }
    let(:category) { create(:category) }

    it "Opened banners list" do
      pending_banner = create(:banner, category: category, status: :pending)
      published_banner = create(:banner, category: category, status: :published)
      closed_banner = create(:banner, category: category, status: :closed)

      visit admin_banners_path

      expect(page).to have_content(pending_banner.name)
      expect(page).to have_content(published_banner.name)
      expect(page).to have_no_content(closed_banner.name)
    end

    it "Closed banners list" do
      pending_banner = create(:banner, category: category, status: :pending)
      published_banner = create(:banner, category: category, status: :published)
      closed_banner = create(:banner, category: category, status: :closed, closed_at: Time.now)

      visit admin_banners_path(status: 'closed')

      expect(page).to have_no_content(pending_banner.name)
      expect(page).to have_no_content(published_banner.name)
      expect(page).to have_content(closed_banner.name)
    end

    it "Should create new banner" do
      categories = create_list(:category, 2)
      visit new_admin_banner_path(create(:banner))

      fill_in "banner[name]", with: Faker::Lorem.word
      select categories[0].name, from: "banner[category_id]"

      expect { click_button "Create Banner" }.to change(Banner, :count).by(1)
    end

    it "Should delete banner" do
      banners = create_list(:banner, 2)
      visit admin_banners_path
      expect { find("a[href='/admin/banners/#{banners[0].id}']").click }.to change(Banner, :count).by(-1)
    end
  end
end
