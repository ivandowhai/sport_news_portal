require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :request do
  context "Signed as admin" do
    before(:each) { sign_in create(:user) }

    context "index page" do
      before(:all) do
        @pending_survey = create(:survey, status: :pending)
        @published_survey = create(:survey, status: :published)
        @closed_survey = create(:survey, status: :closed)
      end

      it "Opened surveys list" do
        visit admin_surveys_path

        expect(page).to have_content(@pending_survey.question)
        expect(page).to have_content(@published_survey.question)
        expect(page).to have_no_content(@closed_survey.question)
      end

      it "Closed surveys list" do
        visit admin_surveys_path(status: 'closed')

        expect(page).to have_no_content(@pending_survey.question)
        expect(page).to have_no_content(@published_survey.question)
        expect(page).to have_content(@closed_survey.question)
      end
    end
  end
end
