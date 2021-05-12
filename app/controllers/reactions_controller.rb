class ReactionsController < PortalController
  def create
    delete_old_reaction

    new_reaction = Reaction.new(reaction_params)
    new_reaction.user = current_user
    if new_reaction.save
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    if reaction.destroy
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def reaction
    @reaction ||= Reaction.find_by(comment_id: params[:comment_id], user_id: current_user.id)
  end

  def reaction_params
    params.require(:reaction).permit(:comment_id, :like)
  end

  def delete_old_reaction
    Reaction.find_by(comment_id: params[:reaction][:comment_id], user_id: current_user.id)&.destroy
  end
end
