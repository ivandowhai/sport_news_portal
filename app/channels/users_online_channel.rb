class UsersOnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users_online"
    current_user.online = true
    current_user.save!
  end

  def unsubscribed
    current_user.online = false
    current_user.save!
  end
end
