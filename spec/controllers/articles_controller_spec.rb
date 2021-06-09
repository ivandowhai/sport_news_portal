require "rails_helper"

RSpec.describe ArticlesController, type: :request do
  let(:category) { create(:category) }

  it "Shows articles list by category" do
    articles = create_list(:article, 5, category: category)
    visit category_articles_path(category)

    articles.each do |article|
      expect(page).to have_content(article.title)
    end
  end

  it "Shows one article" do
    article = create(:article, category: category)
    visit category_article_path(category, article)
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.body)
  end

  it "Search articles" do
    articles = create_list(:article, 2, category: category)
    must_be_founded = create(:article, category: category, title: "Article I want to find")

    visit "/search?query=find"
    articles.each do |article|
      expect(page).to have_no_content(article.title)
    end

    expect(page).to have_content(must_be_founded.title)
  end
end
