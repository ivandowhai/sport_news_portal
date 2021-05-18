require "rails_helper"

RSpec.describe Admin::HomeController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }

    it "Disable" do
      setting = create(:site_setting)
      put "/admin/settings/#{setting.key}", xhr: true, params: {enabled: false}

      expect(setting.reload.settings["enabled"]).to eq false
    end

    it "Enable" do
      setting = create(:site_setting, :disabled)
      put "/admin/settings/#{setting.key}", xhr: true, params: {enabled: true}

      expect(setting.reload.settings["enabled"]).to eq true
    end

    it "Set period" do
      setting = create(:site_setting, :disabled)
      put "/admin/settings/#{setting.key}", xhr: true, params: {period: "week"}

      expect(setting.reload.settings["period"]).to eq "week"
    end
  end
end
