Rails.application.routes.draw do
  get 'message/new'
  get 'message/create'
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
