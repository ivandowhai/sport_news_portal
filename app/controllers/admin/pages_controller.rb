class Admin::PagesController < Admin::AdminController
  def index
    @categories = PageCategory.all.order("id")
    @pages = Page.all.eager_load(:page_category)
  end

  def create
    page = Page.new
    page.page_category = PageCategory.find(params[:category_id])
    page.name = params[:name]
    page.slug = params[:name].downcase.tr(" ", "-").tr("/", "")
    page.save
    redirect_to admin_pages_path
  end

  def edit
    @categories = PageCategory.all.map { |category| [category.name, category.id] }
    @page = Page.find(params[:id])
  end

  def update
    page = Page.find(params[:id])
    page.name = params[:page][:name]
    page.body = params[:page][:body]
    page.slug = params[:page][:name].downcase.tr(" ", "-").tr("/", "")
    page.order = params[:page][:order]
    page.page_category = PageCategory.find(params[:page][:category_id])
    page.save
    redirect_to admin_pages_path
  end

  def enable
    page = Page.find(params[:id])
    page.enabled = params[:enabled] == "true"
    page.save
    render json: page
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy if page.can_delete?
    redirect_to admin_pages_path
  end

  def enable_category
    page = PageCategory.find(params[:id])
    page.enabled = params[:enabled] == "true"
    page.save
    render json: page
  end
end
