class ArticlesController < PortalController
  include Pundit

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.load
  end

  def show
    @article = Article.find(params[:article_id])
    @comments = @article.comments.load
    @comment = Comment.new
  end
end
