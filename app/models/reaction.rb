class Reaction < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  counter_culture :comment, column_name: proc { |model| model.like ? "likes_count" : "dislikes_count" }
end
