class Admin::UsersController < Admin::AdminController
  def index
    @users = User.filtered_list(params)
    @params = params
  end

  def show
    user
  end

  def new
    @roles = User.get_roles
    @user = User.new
  end

  def edit
    @roles = User.get_roles
    @user = user
  end

  def create
    @roles = User.get_roles
    @user = User.new(user_params)
    password = Admin::UserHelper.generate_password
    @user.password = password

    if @user.save
      UserMailer.with(user: @user, password: password).password_notification.deliver_now
      redirect_to admin_user_path @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if user.update(user_params)
      render json: {}, status: :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user.destroy
    redirect_to admin_users_path, notice: "User was successfully destroyed."
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role, :enabled)
  end
end
