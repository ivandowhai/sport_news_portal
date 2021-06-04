module SurveysHelper
  def self.calculate_total(answers)
    answers.reduce(0) { |sum, answer| sum + answer.votes }
  end
end
