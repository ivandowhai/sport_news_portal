# frozen_string_literal: true

class Admin::MainController < Admin::AdminController
  def index
    redirect_to admin_articles_by_category_url(Category.first)
  end
end
