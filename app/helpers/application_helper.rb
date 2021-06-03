module ApplicationHelper
  def show_newest_survey?
    path = Rails.application.routes.recognize_path(request.env["PATH_INFO"])
    path[:controller] != "surveys" && current_user.nil? == false
  end
end
