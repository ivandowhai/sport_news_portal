json.extract! user, :id, :email, :role, :created_at, :updated_at
json.url admin_article_url(user, format: :json)
