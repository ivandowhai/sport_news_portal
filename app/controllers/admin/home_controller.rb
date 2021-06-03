# frozen_string_literal: true

class Admin::HomeController < Admin::AdminController
  def index
    @site_settings = SettingsHelper.format_settings(SiteSetting.all)
    @periods = SiteSetting::PERIODS
    @photo_of_the_day = PhotoOfTheDay.first || PhotoOfTheDay.new
    @errors = params[:errors]
  end

  def update
    if params[:enabled]
      site_setting.parameters["enabled"] = ActiveRecord::Type::Boolean.new.cast(params[:enabled])
    end
    if params[:period]
      site_setting.parameters["period"] = params[:period]
    end
    if site_setting.save
      render json: site_setting
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end

  def photo_of_the_day
    photo_of_the_day = PhotoOfTheDay.first
    if photo_of_the_day.nil?
      photo_of_the_day = PhotoOfTheDay.new(photo_of_the_day_params)
      photo_of_the_day.save
    else
      photo_of_the_day.update(photo_of_the_day_params)
    end
    flash[:errors] = photo_of_the_day.errors
    redirect_to admin_root_path
  end

  private

  def site_setting
    @site_setting ||= SiteSetting.find_by(key: params[:key])
  end

  def photo_of_the_day_params
    params.require(:photo_of_the_day).permit(:picture, :alt, :title, :description, :author, :show)
  end
end
