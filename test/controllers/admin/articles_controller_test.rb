require "test_helper"

class Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @category = categories(:one)
  end

  test "should get index" do
    get admin_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post admin_articles_url, params: { article: { body: @article.body, title: @article.title, category_id: @category.id } }
    end

    assert_redirected_to admin_article_url(Article.last, notice: 'Article was successfully created.')
  end

  test "should show article" do
    get admin_article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch admin_article_url(@article), params: { article: { body: @article.body, title: @article.title, category_id: @category.id } }
    assert_redirected_to admin_article_url(@article, notice: 'Article was successfully updated.')
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete admin_article_url(@article)
    end

    assert_redirected_to admin_articles_url
  end
end
