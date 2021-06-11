class SurveyValidator < ActiveModel::Validator
  def validate(record)
    unless record.start_at >= Date.today
      record.errors[:start_at] << "Start can't be in the past"
    end
    unless record.end_at > record.start_at
      record.errors[:end_at] << "End must be greater than start"
    end
  end
end
