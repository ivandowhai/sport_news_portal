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

  resources :categories do
    resources :articles do
      resources :comments
    end
  end

  get '/pages/:slug', to: 'pages#show'

  post '/reaction', to: 'reactions#create'
  delete '/reaction/:comment_id', to: 'reactions#destroy'

  get '/locale/:locale', to: 'main#locale'

  namespace 'admin' do
    root 'main#index'
    resources :categories
    resources :articles
    resources :users
    resources :locales

    put '/locales/enable/:id', to: 'locales#enable'
    put '/locales/disable/:id', to: 'locales#disable'

    get '/articles/by_category/:category_id', to: 'articles#index', as: 'articles_by_category'

    resources :pages
    put '/pages/enable/:id', to: 'pages#enable'
    put '/pages/disable/:id', to: 'pages#disable'

    put '/page_category/enable/:id', to: 'page_categories#enable'
    put '/page_category/disable/:id', to: 'page_categories#disable'
  end
end
