require 'sidekiq/web'
Rails.application.routes.draw do
  root to: 'messages#new'
  resources :messages
  resources :users
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  post '/callback', to: 'user_sessions#callback'
  # get '/oauth2callback', to: 'user_sessions#new'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
end
