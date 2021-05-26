class Admin::BannersController < Admin::AdminController
  include Admin::Concerns::Statusable

  PER_PAGE = 20

  def index
    @status_opened = params[:status].nil? || params[:status] == "opened"
    @banners = @status_opened ?
                 Banner.pending_and_published.includes([:category]).paginate(page: params[:page], per_page: PER_PAGE) :
                 Banner.closed.includes([:category]).paginate(page: params[:page], per_page: PER_PAGE)
    @opened = Banner.pending_and_published.count
    @closed = Banner.closed.count
  end

  def new
    @banner = Banner.new
    @categories = Category.all.map { |category| [category.name, category.id] }
  end

  def create
    @categories = Category.all.map { |category| [category.name, category.id] }
    @banner = Banner.new(banner_params)
    if @banner.save
      redirect_to admin_banners_path, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    model.destroy
    redirect_to admin_banners_path, notice: "Banner was successfully destroyed."
  end

  private

  def banner_params
    params.require(:banner).permit(:name, :image, :category_id)
  end

  def model
    @model ||= Banner.find(params[:id])
  end
end
