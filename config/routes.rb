Rails.application.routes.draw do
  root to: 'messages#index'
  resources :messages, only: [:index, :show]
  get 'coke', to: 'messages#coke'
end
