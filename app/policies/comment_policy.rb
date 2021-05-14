class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def update?
    return false if user.nil?
    user.id == comment.user_id
  end

  def destroy?
    return false if user.nil?
    user.id == comment.user_id || user.is_admin?
  end
end
