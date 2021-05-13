# frozen_string_literal: true

class MainController < PortalController
  def index
  end

  def locale
    I18n.locale = params[:locale]
    redirect_back(fallback_location: root_path)
  end
end
