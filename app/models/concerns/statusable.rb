module Statusable
  extend ActiveSupport::Concern

  included do
    enum status: [:pending, :published, :closed]
    scope :pending_or_published, -> { where(status: [:pending, :published]) }
    scope :pending, -> { where(status: :pending) }
    scope :published, -> { where(status: :published) }
    scope :closed, -> { where(status: :closed) }
  end

  def publish
    published!
    save
  end

  def close
    closed!
    save
  end
end
