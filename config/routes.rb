Rails.application.routes.draw do
  devise_for :users
  root to: 'pianists#index'
  resources :pianists, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end
