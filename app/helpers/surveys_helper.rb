module SurveysHelper
  def self.calculate_total(answers)
    total = 0
    answers.each { |answer| total += answer.votes }
    total
  end
end
