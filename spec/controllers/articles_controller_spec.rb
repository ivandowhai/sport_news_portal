require "rails_helper"

RSpec.describe ArticlesController, type: :request do
  let(:category) { create(:category) }

  it "list by category" do
    articles = create_list(:article, 5, category: category)
    visit articles_by_category_path(category.id)

    articles.each do |article|
      expect(page).to have_content(article.title)
    end
  end

  it "Show one article" do
    article = create(:article, category: category)
    visit article_path(article.id)
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.body)
  end
end
