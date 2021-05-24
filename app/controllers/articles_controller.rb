class ArticlesController < PortalController
  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.load
  end

  def show
    article
    @article.article_views.create
    @comments_details = ArticleCommentsPresenter.new(article, current_user)
    @comment = current_user.nil? ? Comment.new : current_user.comments.new
  end

  def search
    @query = params[:query]
    @articles = params[:query] ? Article.search(@query.downcase) : []
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end
end
