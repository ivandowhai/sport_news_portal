class LocalePolicy
  attr_reader :user, :locale

  def initialize(user, locale)
    @user = user
    @locale = locale
  end

  def delete?
    user.is_admin? && !locale.is_default?
  end
end
