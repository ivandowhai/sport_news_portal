require "rails_helper"

RSpec.describe MainController, type: :request do
  context "see the most popular and the most commented articles" do
    before(:all) do
      category = create(:category)
      @article_1 = create(:article, category: category, views_count: 200, comments_count: 10)
      @article_2 = create(:article, category: category, views_count: 150, comments_count: 30)
      @article_3 = create(:article, category: category, views_count: 100, comments_count: 5)
      @article_4 = create(:article, category: category, views_count: 90, comments_count: 20)
    end

    it "see the list of the most popular articles" do
      create(:site_setting, :most_popular)
      create(:site_setting, :most_commented, :disabled)

      visit root_path

      expect(page).to have_content(I18n.t("most_popular"))
      expect(page).to have_no_content(I18n.t("most_commented"))

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_2.title)
      expect(page).to have_content(@article_3.title)
      expect(page).to have_no_content(@article_4.title)
    end

    it "see the list of the most commented articles" do
      create(:site_setting, :most_popular, :disabled)
      create(:site_setting, :most_commented)

      visit root_path

      expect(page).to have_content(I18n.t("most_commented"))
      expect(page).to have_no_content(I18n.t("most_popular"))

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_2.title)
      expect(page).to have_no_content(@article_3.title)
      expect(page).to have_content(@article_4.title)
    end
  end
end
