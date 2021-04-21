class ArticlesController < PortalController
  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.load
  end

  def show
    @article = Article.find(params[:article_id])
  end
end