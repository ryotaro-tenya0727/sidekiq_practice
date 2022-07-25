require 'sidekiq/web'
Rails.application.routes.draw do
  root to: 'messages#new'
  resources :messages
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
end
