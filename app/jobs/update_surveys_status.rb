require "sidekiq-scheduler"

class UpdateSurveysStatus
  include Sidekiq::Worker

  def perform
    Survey.pending.where("start <= ?", Time.now).update(status: Survey::STATUS_PUBLISHED)
    Survey.published.where('"end" <= ?', Time.now).update(status: Survey::STATUS_CLOSED)
  end
end
