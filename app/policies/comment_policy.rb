class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.nil? == false && user.enabled
  end

  def update?
    return false if user.nil?
    user.id == comment.user_id && user.enabled
  end

  def destroy?
    return false if user.nil?
    (user.id == comment.user_id && user.enabled) || user.admin?
  end
end
