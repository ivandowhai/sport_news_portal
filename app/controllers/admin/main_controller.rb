# frozen_string_literal: true

class Admin::MainController < Admin::AdminController
  def index
    redirect_to admin_category_articles_url(Category.first)
  end
end
