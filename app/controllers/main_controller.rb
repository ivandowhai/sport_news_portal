# frozen_string_literal: true

class MainController < PortalController
  def index
    @site_settings = SettingsHelper.format_settings(SiteSetting.all)
    @most_popular_articles = Article.most_popular
    @most_commented_articles = Article.most_commented
  end

  def locale
    I18n.locale = params[:locale]
    redirect_back(fallback_location: root_path)
  end
end
