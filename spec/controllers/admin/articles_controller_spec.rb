require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :controller do
  describe "GET #index" do
    it { should route(:get, "/admin/articles/by_category/1").to(action: :index, category_id: 1) }
  end

  describe "GET #show" do
    it { should route(:get, "/admin/articles/1").to(action: :show, id: 1) }
  end

  describe "GET #new" do
    it { should route(:get, "/admin/articles/new").to(action: :new) }
  end

  describe "POST #create" do
    it { should route(:post, "/admin/articles").to(action: :create) }
  end

  describe "GET #edit" do
    it { should route(:get, "/admin/articles/1/edit").to(action: :edit, id: 1) }
  end

  describe "PUT #show" do
    it { should route(:put, "/admin/articles/1").to(action: :update, id: 1) }
  end

  describe "DELETE #show" do
    it { should route(:delete, "/admin/articles/1").to(action: :destroy, id: 1) }
  end
end
