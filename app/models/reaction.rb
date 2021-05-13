class Reaction < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  counter_culture :comment, column_name: proc { |model| model.like ? "likes_count" : "dislikes_count" }
  scope :user_likes, ->(user_id) { where(like: true, user_id: user_id) }
  scope :user_dislikes, ->(user_id) { where(like: false, user_id: user_id) }
end
