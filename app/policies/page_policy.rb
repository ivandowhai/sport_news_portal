class PagePolicy
  attr_reader :user, :page

  def initialize(user, page)
    @user = user
    @page = page
  end

  def delete?
    user.admin? && page.can_delete?
  end
end
