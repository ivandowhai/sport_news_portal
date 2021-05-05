require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :request do
  context "Articles" do
    it "Articles by category" do
      sign_in create(:user)
      category = create(:category)
      articles = create_list(:article, 5, category: category)
      visit admin_articles_by_category_path(category.id)

      articles.each do |article|
        expect(page).to have_content(article.title)
      end
    end

    it "Show one article" do
      sign_in create(:user)
      article = create(:article, category: create(:category))
      visit admin_article_path(article.id)
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end

    it "Should create new article" do
      sign_in create(:user)
      categories = create_list(:category, 2)
      visit new_admin_article_path

      fill_in "article[title]", with: "New sport article"
      fill_in "article[body]", with: "New sport article content"
      select categories[0].name, from: "article[category_id]"

      expect { click_button "Create Article" }.to change(Article, :count).by(1)
    end

    it "Should update an existing article" do
      sign_in create(:user)
      categories = create_list(:category, 2)
      article = create(:article, category: categories[0])
      visit edit_admin_article_path(article)

      fill_in "article[title]", with: "Updated sport article"
      fill_in "article[body]", with: "Updated sport article content"
      select categories[1].name, from: "article[category_id]"

      click_button "Update Article"

      expect(article.reload.title).to eq "Updated sport article"
      expect(article.body).to eq "Updated sport article content"
      expect(article.category.name).to eq categories[1].name
    end

    it "Should delete article" do
      sign_in create(:user)
      category = create(:category)
      create_list(:article, 5, category: category)
      visit admin_articles_by_category_path(category.id)

      expect { click_link("Destroy", match: :first) }.to change(Article, :count).by(-1)
    end
  end
end
