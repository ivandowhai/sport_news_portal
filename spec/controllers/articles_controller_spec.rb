require "rails_helper"

RSpec.describe ArticlesController, type: :request do
  context "Articles" do
    it "Articles by category" do
      category = create(:category)
      articles = create_list(:article, 5, category: category)
      visit articles_by_category_path(category.id)

      articles.each do |article|
        page.should have_content(article.title)
      end
    end

    it "Show one article" do
      category = create(:category)
      article = create(:article, category: category)
      visit article_path(article.id)
      page.should have_content(article.title)
      page.should have_content(article.body)
    end
  end
end
