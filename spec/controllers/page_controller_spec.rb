require "rails_helper"

RSpec.describe PagesController, type: :controller do
  fixtures :pages

  describe "GET pages#show" do
    let(:page) { pages(:about_page) }

    it "routes" do
      should route(:get, "/pages/about-sports-hub").to(action: :show, slug: "about-sports-hub")
    end

    it "assigns @page" do
      get :show, params: {slug: "about-sports-hub"}
      expect(assigns(:page)).to eq(page)
    end

    it "renders the show template" do
      get :show, params: {slug: "about-sports-hub"}
      expect(response).to render_template("show")
    end
  end
end
