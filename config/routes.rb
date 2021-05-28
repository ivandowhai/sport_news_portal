# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'

  devise_for :users, controllers: {
    sessions: 'auth/sessions',
    registrations: 'auth/registrations'
  }

  resources :categories do
    resources :articles do
      resources :comments
    end
  end

  get '/search', to: 'articles#search'

  resources :reactions
  resources :surveys

  get '/survey/show_newest', to: 'surveys#show_newest'

  get '/profile', to: 'users#edit'
  put '/profile', to: 'users#update'
  patch '/newsletter/subscribe', to: 'users#subscribe_to_newsletter'

  get '/pages/:slug', to: 'pages#show'

  get '/locale/:locale', to: 'main#locale'

  namespace 'admin' do
    root 'home#index'
    put '/settings/:key', to: 'home#update'
    resources :categories do
      resources :articles
    end
    resources :users
    resources :locales
    resources :banners
    resources :surveys

    put '/banners/publish/:id', to: 'banners#publish'
    put '/banners/close/:id', to: 'banners#close'

    put '/surveys/publish/:id', to: 'surveys#publish'
    put '/surveys/close/:id', to: 'surveys#close'

    put '/locales/enable/:id', to: 'locales#enable'
    put '/locales/disable/:id', to: 'locales#disable'

    resources :pages
    put '/pages/enable/:id', to: 'pages#enable'
    put '/pages/disable/:id', to: 'pages#disable'

    put '/page_category/enable/:id', to: 'page_categories#enable'
    put '/page_category/disable/:id', to: 'page_categories#disable'
  end
end
