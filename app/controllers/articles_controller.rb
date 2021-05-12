class ArticlesController < PortalController
  include Pundit

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.load
  end

  def show
    @article = Article.find(params[:article_id])
    @comments = Comment.comments_with_reactions(params[:article_id], current_user.id)
    @comment = Comment.new
  end
end
