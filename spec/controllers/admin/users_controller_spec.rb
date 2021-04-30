require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  describe "GET #index" do
    it { should route(:get, "/admin/users").to(action: :index) }
  end

  describe "GET #show" do
    it { should route(:get, "/admin/users/1").to(action: :show, id: 1) }
  end

  describe "GET #new" do
    it { should route(:get, "/admin/users/new").to(action: :new) }
  end

  describe "POST #create" do
    it { should route(:post, "/admin/users").to(action: :create) }
  end

  describe "GET #edit" do
    it { should route(:get, "/admin/users/1/edit").to(action: :edit, id: 1) }
  end

  describe "PUT #show" do
    it { should route(:put, "/admin/users/1").to(action: :update, id: 1) }
  end

  describe "DELETE #show" do
    it { should route(:delete, "/admin/users/1").to(action: :destroy, id: 1) }
  end
end
