class UsersController < PortalController
  before_action :authenticate_user!

  def edit
    user
  end

  def update
    if user.update(user_params)
      redirect_to '/profile'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end
end
