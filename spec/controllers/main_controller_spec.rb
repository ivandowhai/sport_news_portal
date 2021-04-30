require "rails_helper"

RSpec.describe MainController, type: :controller do
  describe "GET /" do
    it { should route(:get, '/').to(action: :index) }
  end
end
