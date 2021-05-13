class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :reactions, dependent: :delete_all

  has_many :likes, -> { where reactions: {like: true} }, class_name: "Reaction"
  has_many :dislikes, -> { where reactions: {like: false} }, class_name: "Reaction"

  def edited?
    created_at < updated_at
  end

  def self.comments_with_reactions(article_id)
    Comment.left_outer_joins(:likes, :dislikes)
      .distinct
      .select("comments.*, count(reactions.id) as likes, count(dislikes_comments.id) as dislikes")
      .group("comments.id")
  end
end
