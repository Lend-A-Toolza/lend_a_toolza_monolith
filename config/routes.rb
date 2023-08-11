# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  post '/welcome', to: 'welcome#create', as: :welcome
  get '/result', to: 'welcome#result', as: :result
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout

  resources :tools, only: %i[index show new]

  resources :users, only: [:show], as: :dashboard do
    post '/tools', to: 'tools#create'
  end

  resources :stores, only: [:index]

  # resources :tools
  # get '/api/v1/stores/:location/:radius', to: 'api/v1/stores#index'
  # get '/api/v1/chat_request', to: 'api/v1/chats#show'
  # get '/api/v1/tools/search', to: 'api/v1/tools#search'
  # get '/api/v1/users/:id/tools', to: 'api/v1/tools#show'
  # post '/api/v1/users/:id/tools', to: 'api/v1/tools#create'
  # patch '/api/v1/users/:id/tools/:id', to: 'api/v1/tools#update'
  # delete '/api/v1/users/:id/tools/:id', to: 'api/v1/tools#destroy'
end
