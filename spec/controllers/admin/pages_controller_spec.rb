require "rails_helper"

RSpec.describe Admin::PagesController, type: :controller do
  describe "GET #index" do
    it { should route(:get, "/admin/pages").to(action: :index) }
  end

  describe "GET #show" do
    it { should route(:get, "/admin/pages/1").to(action: :show, id: 1) }
  end

  describe "GET #new" do
    it { should route(:get, "/admin/pages/new").to(action: :new) }
  end

  describe "POST #create" do
    it { should route(:post, "/admin/pages").to(action: :create) }
  end

  describe "GET #edit" do
    it { should route(:get, "/admin/pages/1/edit").to(action: :edit, id: 1) }
  end

  describe "PUT #show" do
    it { should route(:put, "/admin/pages/1").to(action: :update, id: 1) }
  end

  describe "DELETE #show" do
    it { should route(:delete, "/admin/pages/1").to(action: :destroy, id: 1) }
  end

  describe "PUT #enable" do
    it { should route(:put, "/admin/pages/enable/1").to(action: :enable, id: 1) }
  end

  describe "PUT #disable" do
    it { should route(:put, "/admin/pages/disable/1").to(action: :disable, id: 1) }
  end
end
