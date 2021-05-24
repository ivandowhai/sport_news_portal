class NewsletterMailer < ApplicationMailer
  def newsletter
    @user = params[:user]
    @article = params[:article]
    mail to: @user.subscription_email, subject: "Newsletter: #{@article.title}"
  end
end
