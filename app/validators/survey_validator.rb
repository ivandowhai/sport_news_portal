class SurveyValidator < ActiveModel::Validator
  def validate(record)
    unless record.start >= Date.today
      record.errors[:start] << "Start can't be in the past"
    end
    unless record.end > record.start
      record.errors[:end] << "End must be greater than start"
    end
  end
end
