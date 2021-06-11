require "sidekiq-scheduler"

class UpdateSurveysStatus
  include Sidekiq::Worker

  def perform
    Survey.pending.where("start_at <= ?", Time.now).update(status: Survey::STATUS_PUBLISHED)
    Survey.published.where("end_at <= ?", Time.now).update(status: Survey::STATUS_CLOSED)
  end
end
