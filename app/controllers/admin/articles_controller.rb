# frozen_string_literal: true

class Admin::ArticlesController < Admin::AdminController
  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles
  end

  def show
    article
  end

  def new
    @article = Article.new
    @categories = categories_for_list
    @category = Category.find(params[:category_id])
  end

  def edit
    @categories = categories_for_list
    article
  end

  def create
    @categories = categories_for_list
    @article = Article.new(article_params)
    if @article.save
      SendNewsletters.perform_later(@article)
      redirect_to admin_category_article_path @article.category, @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @categories = categories_for_list
    if article.update(article_params)
      redirect_to admin_category_article_path article.category, article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article.destroy
    redirect_to admin_category_articles_path article.category, notice: "Article was successfully destroyed."
  end

  private

  def categories_for_list
    Category.all.map { |category| [category.name, category.id] }
  end

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :caption, :body, :category_id, :image, :video_link)
  end
end
