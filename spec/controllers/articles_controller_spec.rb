require "rails_helper"

RSpec.describe ArticlesController, type: :request do
  context "Articles" do
    it "list by category" do
      category = create(:category)
      articles = create_list(:article, 5, category: category)
      visit articles_by_category_path(category.id)

      articles.each do |article|
        expect(page).to have_content(article.title)
      end
    end

    it "Show one article" do
      article = create(:article, category: create(:category))
      visit article_path(article.id)
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
