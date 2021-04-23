# frozen_string_literal: true

class Admin::ArticlesController < Admin::AdminController

  PER_PAGE = 20

  def index
    @articles = Article.limit(PER_PAGE).eager_load(:category)
  end

  def show
    @article = article
  end

  def new
    @article = Article.new
    @categories = categories
  end

  def edit
    @article = article
    @categories = categories
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @article = article
    if @article.update(article_params)
      redirect_to admin_article_path @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = article
    @article.destroy
    redirect_to admin_articles_path, notice: "Article was successfully destroyed."
  end

  private

  def categories
    Category.all.map { |category| [category.name, category.id] }
  end

  def article
    Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end
end
