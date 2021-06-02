class Admin::TeamsController < Admin::AdminController
  def index
    @categories = Category.first_level
    @subcategories = params[:category_id] ? Category.where(category_id: params[:category_id]) : []
    @teams = Team.filter(params)
    @params = params
  end

  def new
    @team = Team.new
    @categories = Category.first_level
    @subcategories = []
  end

  def create
    @team = Team.new(team_params)
    @categories = Category.first_level
    @subcategories = []
    if @team.save
      redirect_to admin_teams_path, notice: "Team was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    team
    @categories = Category.first_level
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

  def team
    @team ||= Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:location, :team, :category_id, :subcategory_id, :logo)
  end
end
