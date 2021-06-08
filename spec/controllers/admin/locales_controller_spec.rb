require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }

    it "Locales list" do
      locales = create_list(:locale, 2)
      visit admin_locales_path
      locales.each { |locale| expect(page).to have_content(locale.code.upcase) }
    end

    it "Should create locale" do
      post admin_locales_path, params: {locale: {code: "pl"}}
      expect(response).to redirect_to(admin_locales_path(1, notice: "Locale was successfully created."))
    end

    it "Should enable locale" do
      locale = create(:locale)
      put "/admin/locales/enable/#{locale.id}"
      expect(locale.reload.enabled).to be true
    end

    it "Should disable locale" do
      locale = create(:locale, enabled: true)
      put "/admin/locales/disable/#{locale.id}"
      expect(locale.reload.enabled).to be false
    end

    it "Should delete locale" do
      locales = create_list(:locale, 2)
      visit admin_locales_path
      expect { find("a[href='/admin/locales/#{locales[0].id}']").click }.to change(Locale, :count).by(-1)
    end
  end
end
