class PortalController < ApplicationController
  before_action :set_links

  private

  def set_links
    @categories = Category.enabled
    @pages = Page.enabled
    @page_categories = PageCategory.enabled
    @locales = Locale.enabled
  end
end
