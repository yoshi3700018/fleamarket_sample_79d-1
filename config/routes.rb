Rails.application.routes.draw do

  devise_for :users, controllers: {
    # registrationsコントローラーの参照先を書き換えてウィザード形式の登録画面を作成する
    registrations: 'users/registrations',
    # SNS Credentials設定
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get   'address',        to: 'users/registrations#new_address'
    post  'address',        to: 'users/registrations#create_address'
    # registrationでクレジットカード情報を保存しない仕様になるので、後ほど削除する
    get   'creditcard',    to: 'users/registrations#new_creditcard'
    post  'creditcard',    to: 'users/registrations#create_creditcard'
  end

  root to: 'products#index'

  resources :products do
    resources :buyers, only: [:index] do
      collection do
        post 'pay', to: 'buyers#pay'
        get 'done', to: 'buyers#done'       
      end
    end
    collection do
      get 'search_level2', defaults: { format: 'json'}
      get 'search_level3', defaults: { format: 'json'}
    end
    # edit, update, destroy用後で実装
    member do
      get 'search_level2', defaults: { format: 'json' }
      get 'search_level3', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get   'profile'               # プロフィール作成様、profile_user_path
      patch 'profile_update'        # プロフィール編集用、profile_update_user_path
      get   'logout'                # ログアウトボタン表示用、logout_user_path
      get   'building_construction' # ページがまだ用意できていないところにパスを通す、building_construction_user_path
    end
  end
  
  resources :registration, only: [:index]
  resources :categories, only: [:index, :show]
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end
