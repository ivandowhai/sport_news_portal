class PortalController < ApplicationController
  before_action :set_links

  private

  def set_links
    @categories = Category.where(enabled: true)
    @pages = Page.where(enabled: true).order('"order"')
    @page_categories = PageCategory.where(enabled: true).order("id")
  end
end
