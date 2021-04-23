class Admin::AdminController < ApplicationController
  before_action :authenticate_user!, :check_is_admin

  layout "admin"

  def check_is_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end
