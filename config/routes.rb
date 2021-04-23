# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'

  devise_for :users

  scope module: 'auth' do
    devise_scope :user do
      get '/sign_out', to: 'sessions#destroy'
    end
  end

  get '/articles/by_category/:category_id', to: 'articles#index', as: 'articles_by_category'
  get '/articles/:article_id', to: 'articles#show', as: 'article'

  namespace 'admin' do
    root 'main#index'
    resources :categories
    resources :articles
    resources :users
  end
end
