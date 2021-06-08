class Admin::SurveysController < Admin::AdminController
  include Admin::Concerns::Statusable

  PER_PAGE = 20

  def index
    @status_opened = params[:status].nil? || params[:status] == "opened"
    @surveys = Survey.surveys_list_by_statuses(@status_opened).paginate(page: params[:page], per_page: PER_PAGE)
    @opened = Survey.pending_or_published.count
    @closed = Survey.closed.count
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to admin_surveys_path, notice: "Survey was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    model.destroy
    redirect_to admin_surveys_path, notice: "Survey was successfully destroyed."
  end

  private

  def survey_params
    params.require(:survey).permit(:question, :start_at, :end_at, answers_attributes: [:answer])
  end

  def model
    @model ||= Survey.find(params[:id])
  end
end
