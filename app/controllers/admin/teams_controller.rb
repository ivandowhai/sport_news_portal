class Admin::TeamsController < Admin::AdminController
  before_action :first_level_categories, except: [:update, :destroy]
  def index
    @subcategories = params[:category_id] ? Category.where(category_id: params[:category_id]) : []
    @teams = Team.filter(params)
    @params = params
  end

  def new
    @team = Team.new
    @subcategories = []
  end

  def create
    @team = Team.new(team_params)
    @subcategories = []
    if @team.save
      redirect_to admin_teams_path, notice: "Team was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    team
    @subcategories = Category.where(category_id: team.category_id)
  end

  def update
    if team.update(team_params)
      redirect_to admin_teams_path, notice: "Team was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    team.destroy
    redirect_to admin_teams_path, notice: "Team was successfully destroyed."
  end

  private

  def first_level_categories
    @categories = Category.first_level
  end

  def team
    @team ||= Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:location, :team, :category_id, :subcategory_id, :logo)
  end
end
