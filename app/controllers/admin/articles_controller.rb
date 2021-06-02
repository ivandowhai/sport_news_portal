# frozen_string_literal: true

class Admin::ArticlesController < Admin::AdminController
  PER_PAGE = 10

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def show
    article
  end

  def new
    @article = Article.new
    @categories = Category.all
    @teams = Team.all
    @category = Category.find(params[:category_id])
  end

  def edit
    @categories = Category.all
    @teams = Team.all
    article
  end

  def create
    @categories = Category.all
    @teams = Team.all
    @article = Article.new(article_params)
    if @article.save
      SendNewsletters.perform_later(@article)
      redirect_to admin_category_article_path @article.category, @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @categories = Category.all
    @teams = Team.all
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

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :caption, :body, :category_id, :image, :video_link, :team_id)
  end
end
