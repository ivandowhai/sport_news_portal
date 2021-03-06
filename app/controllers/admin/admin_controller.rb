class Admin::AdminController < ApplicationController
  before_action :authenticate_user!, :check_is_admin, :set_navigation, :set_categories

  layout "admin"

  private

  def check_is_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def set_navigation
    @navigation = [
      {title: "Home", url: admin_root_path},
      {title: "Categories", url: admin_categories_path},
      {title: "Teams", url: admin_teams_path},
      {title: "Users", url: admin_users_path},
      {title: "Footer", url: admin_pages_path},
      {title: "Locales", url: admin_locales_path},
      {title: "Banners", url: admin_banners_path},
      {title: "Surveys", url: admin_surveys_path}
    ]
  end

  def set_categories
    @categories_for_nav = Category.where(enabled: true)
  end
end
