class PortalController < ApplicationController
  before_action :set_categories, :set_pages

  private

  def set_categories
    @categories = Category.where(enabled: true)
  end

  def set_pages
    @pages = Page.get_enabled_by_categories
  end
end
