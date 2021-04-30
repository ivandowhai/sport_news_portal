require "rails_helper"

RSpec.describe Admin::PageCategoriesController, type: :controller do
  describe "PUT #enable" do
    it { should route(:put, "/admin/page_category/enable/1").to(action: :enable, id: 1) }
  end

  describe "PUT #disable" do
    it { should route(:put, "/admin/page_category/disable/1").to(action: :disable, id: 1) }
  end
end
