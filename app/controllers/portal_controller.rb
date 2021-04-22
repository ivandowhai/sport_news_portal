class PortalController < ApplicationController
  before_action :set_categories

  private

  def set_categories
    @categories = Category.where(enabled: true)
  end
end
