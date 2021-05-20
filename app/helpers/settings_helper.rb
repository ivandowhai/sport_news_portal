module SettingsHelper
  def self.format_settings(settings)
    result = {}
    settings.each { |model| result[model.key.to_sym] = model }
    result
  end
end
