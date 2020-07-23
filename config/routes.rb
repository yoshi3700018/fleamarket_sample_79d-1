Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    collection do
      get 'confirm'
    end
  end
end