require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }

    context "Articles list" do
      before(:all) do
        @category = create(:category)
        @articles = create_list(:article, 5, category: @category)
      end

      it "Shows list articles by category" do
        visit admin_category_articles_path(@category.id)
        @articles.each { |article| expect(page).to have_content(article.title) }
      end

      it "Should delete article" do
        visit admin_category_articles_path(@category.id)
        expect { click_link("Destroy", match: :first) }.to change(Article, :count).by(-1)
      end
    end

    context "One article" do
      before(:all) do
        @article = create(:article)
        @categories = create_list(:category, 2)
      end

      it "Shows one article" do
        visit admin_category_article_path(@article.category, @article)
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
      end

      it "Should create new article" do
        visit new_admin_category_article_path(@article.category)

        fill_in "article[title]", with: Faker::Lorem.sentence
        fill_in "article[body]", with: Faker::Lorem.paragraph
        select @categories[0].name, from: "article[category_id]"

        expect { click_button "Create Article" }.to change(Article, :count).by(1)
      end

      it "Should update an existing article" do
        visit edit_admin_category_article_path(@article.category, @article)

        video_id = Faker::Internet.password(min_length: 11)
        new_title = Faker::Lorem.sentence
        new_body = Faker::Lorem.paragraph
        fill_in "article[title]", with: new_title
        fill_in "article[body]", with: new_body
        fill_in "article[video_link]", with: "https://www.youtube.com/watch?v=#{video_id}"
        select @categories[1].name, from: "article[category_id]"

        click_button "Update Article"

        expect(@article.reload.title).to eq new_title
        expect(@article.body).to eq new_body
        expect(@article.video_link).to eq "https://www.youtube-nocookie.com/embed/#{video_id}"
        expect(@article.category.name).to eq @categories[1].name
      end
    end
  end
end
