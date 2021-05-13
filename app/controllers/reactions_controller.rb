class ReactionsController < PortalController
  before_action :authenticate_user!

  def create
    reaction = current_user.reactions.find_by(comment_id: params[:reaction][:comment_id])
    if reaction.nil?
      reaction = current_user.reactions.create(reaction_params)
    else
      reaction.like = params[:reaction][:like]
    end

    if reaction.save
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
    @reaction ||= current_user.reactions.find(params[:id])
  end

  def reaction_params
    params.require(:reaction).permit(:comment_id, :like)
  end
end
