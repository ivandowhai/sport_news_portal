class Admin::AdminController < ApplicationController
  before_action :authenticate_user!, :check_is_admin, :set_navigation, :set_categories

  layout "admin"

  def check_is_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end

  def set_navigation
    @navigation = [
      {title: "Home", url: admin_root_path},
      {title: "Categories", url: admin_categories_path},
      {title: "Users", url: admin_users_path},
      {title: "Footer", url: admin_pages_path},
      {title: "Locales", url: admin_locales_path}
    ]
  end

  def set_categories
    @categories_for_nav = Category.where(enabled: true)
  end
end
