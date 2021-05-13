class ArticlesController < PortalController
  include Pundit

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.load
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @user_likes_comments = current_user.nil? ? [] : Reaction.user_likes(current_user.id).pluck(:comment_id)
    @user_dislikes_comments = current_user.nil? ? [] : Reaction.user_dislikes(current_user.id).pluck(:comment_id)
    @comment = Comment.new
  end
end
