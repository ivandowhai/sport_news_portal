module Admin::BannersHelper
  def status(banner)
    statuses = {
      pending: {
        text: "Not published",
        class: "btn-info"
      },
      published: {
        text: "Published",
        class: "btn-success"
      },
      closed: {
        text: "Closed",
        class: "btn-dark"
      }
    }
    statuses[banner.status.to_sym]
  end

  def banners
    path = Rails.application.routes.recognize_path(request.env["PATH_INFO"])
    return [] unless path[:controller] == "articles"
    Banner.published.where(category_id: path[:category_id])
  end
end
