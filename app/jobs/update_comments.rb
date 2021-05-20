require "sidekiq-scheduler"

class UpdateComments
  include Sidekiq::Worker

  def perform
    period = SiteSetting.find_by(key: SiteSetting::MOST_COMMENTED)
    min_date = Date.today.send("prev_#{period.settings["period"]}")

    comments = Comment.select("article_id, count(*) as count").where("created_at >= ?", min_date).group(:article_id).to_ary
    articles = Article.where("id in (?)", comments.pluck(:article_id))
    articles.each do |article|
      article.update_attribute(:comments_count, comments.find { |comment| comment.article_id == article.id }.count)
    end
    Article.reset_comments(comments.pluck(:article_id))
  end
end
