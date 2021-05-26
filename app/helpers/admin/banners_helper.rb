module Admin::BannersHelper
  extend Admin::StatusableHelper

  def banners
    path = Rails.application.routes.recognize_path(request.env["PATH_INFO"])
    return [] unless path[:controller] == "articles"
    Banner.published.where(category_id: path[:category_id])
  end
end
