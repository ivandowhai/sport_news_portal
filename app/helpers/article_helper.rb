module ArticleHelper
  def get_search_fragment(article, query)
    text = article.title.downcase.include?(query) ? article.title.downcase : article.body.downcase
    position = text.index(query)
    start = position - 100 > 0 ? position - 100 : 0
    finish = position + 100 + query.length
    text = text.gsub!(query, "<strong>#{query}</strong>")
    text[start..finish]
  end
end
