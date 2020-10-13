Rails.application.routes.draw do
  devise_for :users
  root to: 'pianists#index'
  resources :pianists, only: [:index, :new, :create, :show]
end
