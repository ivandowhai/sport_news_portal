class Admin::PagesController < Admin::AdminController
  def index
    @categories = PageCategory.all.order(:id)
    @pages = Page.all.eager_load(:page_category)
    @newsletter_subscription = SiteSetting.newsletter_subscription
  end

  def create
    page = Page.new(page_params)
    if page.save
      redirect_to admin_pages_path page, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = PageCategory.all.map { |category| [category.name, category.id] }
    page
  end

  def update
    if page.update page_params
      redirect_to admin_pages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def enable
    if page.enable
      render json: page
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end

  def disable
    if page.disable
      render json: page
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end

  def destroy
    if page.can_delete?
      page.destroy
    end

    redirect_to admin_pages_path
  end

  def page_params
    params.require(:page).permit(:name, :body, :enabled, :priority, :page_category_id)
  end

  private

  def page
    @page ||= Page.find(params[:id])
  end
end
