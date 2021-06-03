class Answer < ApplicationRecord
  belongs_to :survey
  has_and_belongs_to_many :users

  def self.answers_with_votes_count(survey_id)
    select("answers.*, count(au.user_id) as votes")
      .where(survey_id: survey_id)
      .joins("left join answers_users au on answers.id = au.answer_id")
      .group("answers.id")
  end

  def percent_votes(total)
    return 0 if total == 0
    100 / total * votes
  end
end
