require "rails_helper"

RSpec.describe MainController, type: :controller do
  describe "GET /" do
    it { should route(:get, "/").to(action: :index) }

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
