class CommentsController < PortalController
  def create
    @comment = current_user.comments.new(comment_params.merge(article: article))
    if @comment.save
      redirect_to category_article_path(
        @comment.article.category_id,
        @comment.article
      )
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

    redirect_to category_article_path(
      @comment.article.category_id,
      @comment.article
    )
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
