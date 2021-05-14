class ArticlesController < PortalController
  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.load
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.eager_load(:user)
    comment_ids = @comments.pluck(:id)
    @user_likes_comments = current_user.nil? ? [] : current_user.likes.where(comment_id: comment_ids)
    @user_dislikes_comments = current_user.nil? ? [] : current_user.dislikes.where(comment_id: comment_ids)
    @comment = current_user.nil? ? nil : current_user.comments.new
  end
end
