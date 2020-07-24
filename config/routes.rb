Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'

  resources :users, only: [:show, :edit, :update] do
    member do
      get 'profile'           # profile_user_path         サインアップセッション１
      patch 'profile_update'  # profile_update_user_path  
      get 'logout'            # logout_user_path          
    end
  end

  resources :products


end
