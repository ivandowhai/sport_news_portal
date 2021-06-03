module Statusable
  extend ActiveSupport::Concern

  STATUS_PENDING = 0
  STATUS_PUBLISHED = 1
  STATUS_CLOSED = 2

  included do
    scope :pending_and_published, -> { where(status: [STATUS_PENDING, STATUS_PUBLISHED]) }
    scope :pending, -> { where(status: STATUS_PENDING) }
    scope :published, -> { where(status: STATUS_PUBLISHED) }
    scope :closed, -> { where(status: STATUS_CLOSED) }
  end

  def publish
    self.status = STATUS_PUBLISHED
    save
  end

  def close
    self.status = STATUS_CLOSED
    save
  end
end
