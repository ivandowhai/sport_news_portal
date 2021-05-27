class UsersController < PortalController
  before_action :authenticate_user!

  def edit
    user
  end

  def update
    if user.update(user_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def subscribe_to_newsletter
    user.update(subscription_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end

  def subscription_params
    params.require(:user).permit(:subscription_email)
  end
end
