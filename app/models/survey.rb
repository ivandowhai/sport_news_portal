class Survey < ApplicationRecord
  include Statusable

  has_many :answers

  def self.surveys_list_by_statuses(status_opened)
    if status_opened
      query = pending_and_published
    else
      query = closed
    end
    query.select('surveys.*, count(answers_users.user_id) as responses')
         .joins('left join answers on answers.survey_id = surveys.id left join answers_users on answers_users.answer_id = answers.id')
         .group('surveys.id')
  end
end
