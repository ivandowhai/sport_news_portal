class SendNewsletters < ActiveJob::Base
  def perform(article)
    users = User.subscribed
    users.each do |user|
      NewsletterMailer.with(user: user, article: article).newsletter.deliver_now
    end
  end
end
