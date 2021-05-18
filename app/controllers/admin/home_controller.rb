# frozen_string_literal: true

class Admin::HomeController < Admin::AdminController
  def index
    @site_settings = SiteSetting.settings_by_keys
    @periods = SiteSetting::PERIODS
  end

  def update
    if params[:enabled]
      site_setting.settings["enabled"] = ActiveRecord::Type::Boolean.new.cast(params[:enabled])
    end
    if params[:period]
      site_setting.settings["period"] = params[:period]
    end
    if site_setting.save
      render json: site_setting
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end

  private

  def site_setting
    @site_setting ||= SiteSetting.find_by(key: params[:key])
  end
end
