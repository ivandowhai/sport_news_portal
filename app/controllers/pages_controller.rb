class PagesController < PortalController
  def show
    @page = Page.find_by!(slug: params[:slug])
  end
end
