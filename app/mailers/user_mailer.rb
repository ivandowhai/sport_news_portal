class UserMailer < ApplicationMailer
  def password_notification
    @user = params[:user]
    @password = params[:password]
    mail to: @user.email, subject: "Your account was created"
  end
end
