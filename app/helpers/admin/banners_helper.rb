module Admin::BannersHelper
  extend Admin::StatusableHelper

  def show_banners?
    Rails.application.routes.recognize_path(request.env["PATH_INFO"])[:controller] == "articles"
  end
end
