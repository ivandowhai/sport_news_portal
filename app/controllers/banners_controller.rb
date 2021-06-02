class BannersController < PortalController
  def index
    @banners = Category.find(params[:category_id]).banners.published
    render "banners/index", layout: false
  end
end
