Rails.application.routes.draw do
  devise_for :users
  root to: 'pianists#index'
  resources :pianists, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
