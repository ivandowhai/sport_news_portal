require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  fixtures :categories, :articles

  let(:first) { articles(:first) }
  let(:second) { articles(:second) }

  describe "GET articles#index" do
    let(:football) { categories(:football)}

    it "route" do
      should route(:get, "/articles/by_category/1").to(action: :index, category_id: 1)
    end

    it "assigns @articles and @category" do
      get :index, params: {category_id: football.id}
      expect(assigns(:articles)).to eq([first, second])
      expect(assigns(:category)).to eq(football)
    end

    it "renders the index template" do
      get :index, params: {category_id: football.id}
      expect(response).to render_template("index")
    end
  end

  describe "GET articles#show" do
    it "route" do
      should route(:get, "/articles/1").to(action: :show, article_id: 1)
    end

    it "assigns @article" do
      get :show, params: {article_id: first.id}
      expect(assigns(:article)).to eq(first)
    end

    it "renders the show template" do
      get :show, params: {article_id: first.id}
      expect(response).to render_template("show")
    end
  end
end
