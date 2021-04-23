class Admin::CategoriesController < Admin::AdminController
  def index
    @categories = Category.order(:order)
  end

  def show
    @category = category
  end

  def new
    @categories = categories_for_list
    @category = Category.new
  end

  def edit
    @categories = categories_for_list
    @category = category
  end

  def create
    @categories = categories_for_list
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_category_path @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @categories = categories_for_list
    @category = category
    if @category.update(category_params)
      redirect_to admin_category_path @category, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = category
    @category.destroy
    redirect_to admin_categories_url, notice: "Category was successfully destroyed."
  end

  private

  def categories_for_list
    categories = Category.all.map { |category| [category.name, category.id] }
    categories.unshift ["None", nil]
  end

  def category
    Category.find(params[:id])
  end

  def category_params
    params.fetch(:category).permit(:name, :category_id, :enabled, :order)
  end
end
