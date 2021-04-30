require "rails_helper"

RSpec.describe PagesController, type: :controller do
  describe "GET pages#show" do
    it { should route(:get, '/pages/about-sports-hub').to(action: :show, slug: 'about-sports-hub') }
  end
end
