class ArticleCommentsPresenter
  attr_reader :comments

  def initialize(article, current_user)
    @comments = article.comments.eager_load(:user)
    article.article_views.create
    return unless current_user
    comment_ids = article.comments.pluck(:id)
    @user_likes_comments = current_user.likes.where(comment_id: comment_ids)
    @user_dislikes_comments = current_user.dislikes.where(comment_id: comment_ids)
  end

  def user_likes_comments
    @user_likes_comments || []
  end

  def user_dislikes_comments
    @user_dislikes_comments || []
  end
end
