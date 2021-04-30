require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  describe "GET articles#index" do
    it { should route(:get, "/articles/by_category/1").to(action: :index, category_id: 1) }
  end

  describe "GET articles#show" do
    it { should route(:get, "/articles/1").to(action: :show, article_id: 1) }
  end
end
