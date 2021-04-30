require "rails_helper"

RSpec.describe Admin::MainController, type: :controller do
  describe "GET #index" do
    it { should route(:get, "/admin").to(action: :index) }
  end
end
