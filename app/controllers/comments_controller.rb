class CommentsController < PortalController
  include Pundit

  def create
    @comment = Comment.new(comment_params)
    @comment.article = article
    @comment.user = current_user
    if @comment.save
      redirect_to article_path @comment.article, notice: "Comment was added."
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if comment.update(comment_params)
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    authorize comment
    comment.destroy

    redirect_to article_path @comment.article, notice: "Comment was deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def article
    @article ||= Article.find(params[:article_id])
  end

  def comment
    @comment ||= Comment.find(params[:id])
  end
end
