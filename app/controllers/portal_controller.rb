class PortalController < ApplicationController
  before_action :layout_variables

  private

  def layout_variables
    @categories = Category.enabled
    @pages = Page.enabled
    @page_categories = PageCategory.enabled
    @locales = Locale.enabled
    @site_settings = SettingsHelper.format_settings(SiteSetting.all)
  end
end
