class Admin::PageCategoriesController < Admin::AdminController
  def enable
    if page_category.enable
      render json: page_category
    else
      render json: {error: "Failed to save."}
    end
  end

  def disable
    if page_category.disable
      render json: page_category
    else
      render json: {error: "Failed to save."}
    end
  end

  private

  def page_category
    @page_category ||= PageCategory.find(params[:id])
  end
end
