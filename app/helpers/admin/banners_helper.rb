module Admin::BannersHelper
  def status(banner)
    statuses = {
      Banner::STATUS_PENDING => {
        text: "Not published",
        class: "btn-info"
      },
      Banner::STATUS_PUBLISHED => {
        text: "Published",
        class: "btn-success"
      },
      Banner::STATUS_CLOSED => {
        text: "Closed",
        class: "btn-dark"
      }
    }
    statuses[banner.status]
  end

  def banners
    path = Rails.application.routes.recognize_path(request.env["PATH_INFO"])
    return [] unless path[:controller] == "articles"
    Banner.published.where(category_id: path[:category_id])
  end
end
