class Survey < ApplicationRecord
  include Statusable
  include ActiveModel::Validations
  include AASM

  has_many :answers, dependent: :delete_all

  accepts_nested_attributes_for :answers

  validates :question, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates_with SurveyValidator, on: :create

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :published, :closed

    event :published do
      transitions from: :pending, to: :published
    end

    event :closed do
      transitions from: :published, to: :closed
    end
  end

  def self.surveys_list_by_statuses(status_opened)
    query = status_opened ? pending_or_published : closed
    query.select("surveys.*, count(answers_users.user_id) as responses")
      .left_outer_joins(answers: [:answers_users])
      .group("surveys.id")
  end

  def self.filter(params)
    query = params[:status].nil? || params[:status] == "published" ? published : closed
    if params[:search].present?
      query = query.where("lower(question) like ?", "%#{params[:search].downcase}%")
    end
    if params[:sort_by].present?
      query = query.order(params[:sort_by] == "newest" ? "start_at" : "end_at")
    end
    query
  end

  def self.newest_published_unvoted(user)
    published.where
      .not(id: user.answers.pluck(:survey_id))
      .order(start_at: :desc)
      .first
  end
end
