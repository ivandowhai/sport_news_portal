class PagesController < PortalController
  def show
    @page = Page.find_by!("slug = '%s'", params[:slug])
  end
end
