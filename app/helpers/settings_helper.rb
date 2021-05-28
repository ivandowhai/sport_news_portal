module SettingsHelper
  def self.format_settings(settings)
    result = {}
    settings.each { |model| result[model.key.to_sym] = model }
    result
  end

  def show_newsletter_col(site_settings)
    current_user && site_settings[SiteSetting::NEWSLETTERS_SUBSCRIPTION].parameters["enabled"]
  end
end
