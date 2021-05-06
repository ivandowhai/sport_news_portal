require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }
    let(:categories) { create_list(:category, 3) }
    let(:current_category) { create(:category) }

    it "Categories list" do
      categories
      visit admin_categories_path

      categories.each do |category|
        expect(page).to have_content(category.name)
      end
    end

    it "Show one category" do
      visit admin_category_path(current_category.id)
      expect(page).to have_content(current_category.name)
    end

    it "Should create new category" do
      categories
      visit new_admin_category_path

      fill_in "category[name]", with: "New category"
      select categories[0].name, from: "category[category_id]"

      expect { click_button "Create Category" }.to change(Category, :count).by(1)
    end

    it "Should update an existing category" do
      categories
      visit edit_admin_category_path(current_category)

      fill_in "category[name]", with: "Updated category"
      select categories[1].name, from: "category[category_id]"

      click_button "Update Category"

      expect(current_category.reload.name).to eq "Updated category"
      expect(current_category.category.name).to eq categories[1].name
    end

    it "Should delete category" do
      categories
      visit admin_categories_path

      expect { click_link("Destroy", match: :first) }.to change(Category, :count).by(-1)
    end
  end
end
