
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
    resources :banners, only: :index
  end

  get '/search', to: 'articles#search'

  resources :reactions
  resources :surveys
  resources :teams, only: [:index, :destroy] do
    member do
      post 'attach-to-user', to: 'teams#attach_to_user'
    end
  end

  get '/teams-search', to: 'teams#search'
  get '/team-hub', to: 'teams#team_hub'

  get '/survey/show_newest', to: 'surveys#show_newest'

  get '/profile', to: 'users#edit'
  put '/profile', to: 'users#update'
  patch '/newsletter/subscribe', to: 'users#subscribe_to_newsletter'

  get '/pages/:slug', to: 'pages#show'

  get '/locale/:locale', to: 'main#locale'

  namespace 'admin' do
    root 'home#index'
    put '/settings/:key', to: 'home#update'
    post 'home/photo_of_the_day', to: 'home#photo_of_the_day'
    resources :categories do
      member do
        get 'subcategories'
      end
      resources :articles
    end
    resources :users
    resources :locales
    resources :banners do
      member do
        put 'publish', to: 'banners#publish'
        put 'close', to: 'banners#close'
      end
    end
    resources :teams

    resources :surveys do
      member do
        put 'publish', to: 'surveys#publish'
        put 'close', to: 'surveys#close'
      end
    end

    put '/locales/enable/:id', to: 'locales#enable'
    put '/locales/disable/:id', to: 'locales#disable'

    resources :pages
    put '/pages/enable/:id', to: 'pages#enable'
    put '/pages/disable/:id', to: 'pages#disable'

    put '/page_category/enable/:id', to: 'page_categories#enable'
    put '/page_category/disable/:id', to: 'page_categories#disable'
  end
end
