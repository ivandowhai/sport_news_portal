class Survey < ApplicationRecord
  include Statusable
  include ActiveModel::Validations

  has_many :answers, dependent: :delete_all

  accepts_nested_attributes_for :answers

  validates :question, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates_with SurveyValidator

  def self.surveys_list_by_statuses(status_opened)
    query = status_opened ? pending_and_published : closed
    query.select("surveys.*, count(answers_users.user_id) as responses")
      .left_outer_joins(answers: [:answers_users])
      .group("surveys.id")
  end

  def self.filter(params)
    query = params[:status].nil? || params[:status] == "published" ? published : closed
    unless params[:search].nil?
      query = query.where("lower(question) like ?", "%#{params[:search].downcase}%")
    end
    unless params[:sort_by].nil?
      query = query.order(params[:sort_by] == "newest" ? "start" : '"end"')
    end
    query
  end

  def self.newest_published_unvoted(user)
    published.where
      .not(id: user.answers.pluck(:survey_id))
      .order(start: :desc)
      .first
  end

  def published?
    status == STATUS_PUBLISHED
  end
end
