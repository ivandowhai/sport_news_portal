class Admin::UsersController < Admin::AdminController
  PER_PAGE = 20

  def index
    @users = User.limit(PER_PAGE)
    @roles = [
      {title: 'Users', slug: User::ROLE_USER},
      {title: 'Admins', slug: User::ROLE_ADMIN}
    ]
  end

  def show
    @user = user
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
    @user = user
    if @user.update(user_params)
      redirect_to admin_user_path @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = user
    @user.destroy
    redirect_to admin_users_path, notice: "User was successfully destroyed."
  end

  private

  def user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role)
  end
end
