# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index'

  get '/articles/by_category/:category_id', to: 'articles#index', as: 'articles_by_category'
  get '/articles/:article_id', to: 'articles#show', as: 'article'

  namespace 'admin' do
    root 'main#index'
    resources :categories
    resources :articles
  end
end
