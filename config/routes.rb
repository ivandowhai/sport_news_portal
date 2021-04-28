# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'

  devise_for :users

  scope module: 'auth' do
    devise_scope :user do
      get '/sign_out', to: 'sessions#destroy'
      get '/sign_up', to: 'registrations#new'
      get '/sign_in', to: 'sessions#new'
    end
  end

  get '/articles/by_category/:category_id', to: 'articles#index', as: 'articles_by_category'
  get '/articles/:article_id', to: 'articles#show', as: 'article'
  get '/pages/:slug', to: 'pages#show'

  namespace 'admin' do
    root 'main#index'
    resources :categories
    resources :articles
    resources :users

    get '/articles/by_category/:category_id', to: 'articles#index', as: 'articles_by_category'

    get '/pages', to: 'pages#index'
    post '/pages', to: 'pages#create'
    put '/pages/enable/:id', to: 'pages#enable'
    delete '/pages/:id', to: 'pages#destroy'
    get '/pages/edit/:id', to: 'pages#edit'
    put '/pages/update/:id', to: 'pages#update'
    put '/pages/enable_category/:id', to: 'pages#enable_category'
  end
end
