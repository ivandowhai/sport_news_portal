class Admin::PagesController < Admin::AdminController

  def index
    @pages = Page.get_all_by_categories
  end

  def create
    page = Page.new
    page.category = params[:category]
    page.name = params[:name]
    page.slug = params[:name].downcase.sub(' ', '-')
    page.save
    redirect_to admin_pages_path
  end

  def edit
    @categories = Page.categories_for_select
    @page = Page.find(params[:id])
  end

  def update
    page = Page.find(params[:id])
    page.name = params[:page][:name]
    page.body = params[:page][:body]
    page.slug = params[:page][:name].downcase.sub(' ', '-')
    page.order = params[:page][:order]
    page.category = params[:page][:category]
    page.save
    redirect_to admin_pages_path
  end

  def enable
    page = Page.find(params[:id])
    page.enabled = params[:enabled] == 'true'
    if page.save
      render json: page
    else
      render json: {error: 'Something went wrong.'}
    end
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to admin_pages_path
  end
end