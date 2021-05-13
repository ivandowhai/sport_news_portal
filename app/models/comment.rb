class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :reactions, dependent: :delete_all

  has_many :likes, -> { where reactions: {like: true} }, class_name: "Reaction"
  has_many :dislikes, -> { where reactions: {like: false} }, class_name: "Reaction"

  def edited?
    created_at < updated_at
  end
end
