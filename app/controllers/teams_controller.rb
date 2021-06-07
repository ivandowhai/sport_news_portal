class TeamsController < PortalController
  def index
    @teams = current_user.teams
  end

  def team_hub
    @teams = current_user.teams
    @articles = Article.where(team_id: @teams.pluck(:id))
  end

  def attach_to_user
    if team.users.exclude? current_user
      team.users << current_user
    end
    redirect_back fallback_location: teams_path
  end

  def search
    render json: Team.find_by_name(params[:team])
  end

  def destroy
    team.users.clear
    redirect_back fallback_location: teams_path
  end

  private

  def team
    @team ||= Team.find(params[:id])
  end
end
