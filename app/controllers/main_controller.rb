# frozen_string_literal: true

class MainController < PortalController
  def index
    @most_popular_articles = Article.most_popular
    @most_commented_articles = Article.most_commented
    @photo_of_the_day = PhotoOfTheDay.first
  end

  def locale
    I18n.locale = params[:locale]
    redirect_back(fallback_location: root_path)
  end
end
