require "sidekiq-scheduler"

class UpdateViews
  include Sidekiq::Worker

  def perform
    period = SiteSetting.find_by(key: SiteSetting::MOST_POPULAR)
    min_date = Date.today.send("prev_#{period.settings["period"]}")

    views = ArticleView.select("article_id, count(*) as count").where("created_at >= ?", min_date).group(:article_id).to_ary
    articles = Article.where("id in (?)", views.pluck(:article_id))
    articles.each do |article|
      article.update_attribute(:views_count, views.find { |view| view.article_id == article.id }.count)
    end
    Article.reset_views(views.pluck(:article_id))
  end
end
