class Survey < ApplicationRecord
  include Statusable
  include ActiveModel::Validations

  has_many :answers

  validates :question, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates_with SurveyValidator

  def self.surveys_list_by_statuses(status_opened)
    query = status_opened ? pending_and_published : closed
    query.select("surveys.*, count(answers_users.user_id) as responses")
      .joins("left join answers on answers.survey_id = surveys.id left join answers_users on answers_users.answer_id = answers.id")
      .group("surveys.id")
  end
end
