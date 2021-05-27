class SurveysController < PortalController
  before_action :authenticate_user!

  PER_PAGE = 20

  def index
    @surveys = Survey.filter(params).paginate(page: params[:page], per_page: PER_PAGE)
    @status = params[:status]
  end

  def show
    survey
    @answers = Answer.answers_with_votes_count(survey.id)
    @total = SurveysHelper.calculate_total(@answers)
    @user_answer = current_user.answers.where(id: @answers.pluck(:id)).first
    render "surveys/show", layout: false
  end

  def update
    answer = Answer.find(params[:survey][:answer_id].to_i)
    current_user.answers << answer
    redirect_to surveys_path
  end

  private

  def survey
    @survey ||= Survey.find(params[:id])
  end
end
