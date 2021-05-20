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
    @comment = current_user.nil? ? Comment.new : current_user.comments.new
  end

  def search
    @query = params[:query]
    if params[:query]
      @articles = format_articles_to_search(Article.search(@query.downcase), @query.downcase)
    else
      @articles = []
    end
  end
end

private

def format_articles_to_search(articles, query)
  articles.map do |article|
    text = article.title.downcase.include?(query) ? article.title.downcase : article.body.downcase
    position = text.index(query)
    start = position - 100 > 0 ? position - 100 : 0
    finish = position + 100 + query.length
    text = text.gsub!(query, "<strong>#{query}</strong>")
    article.body = text[start..finish]
    article
  end
end
