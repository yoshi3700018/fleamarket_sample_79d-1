qRails.application.routes.draw do

  devise_for :users, controllers: {
    # registrationsコントローラーの参照先を書き換えてウィザード形式の登録画面を作成する
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get   'address',        to: 'users/registrations#new_address'
    post  'address',        to: 'users/registrations#create_address'
    get   'creditcard',    to: 'users/registrations#new_creditcard'
    post  'creditcard',    to: 'users/registrations#create_creditcard'
  end

  root to: 'products#index'
  resources :products do
    collection do
      get 'confirm'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get   'profile'           # profile_user_path         
      patch 'profile_update'    # profile_update_user_path  
      get   'logout'            # logout_user_path          
    end
  end
  
  resources :registration, only: [:index]

end
