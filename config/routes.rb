Rails.application.routes.draw do
  #会員側 パスワード変更のルーティングを削除し、登録・ログイン用のルーティングを設定
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者側 パスワード変更・登録のルーティングを削除し、ログイン用のルーティングを設定
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "homes#top"
    resources :members, only: [:show, :edit, :update]
    get 'members/confirm' => 'members#confirm'
    patch 'members/leave' => 'members#leave'
    resources :posts, only: [:index, :new, :show, :update, :create]
    resources :comments, only: [:new, :create]
    resources :bookmarks, only: [:create, :destroy]
    get 'searches' => 'searches#index'
  end

  namespace :admin do
    root :to => "homes#top"
    resources :members, only: [:index, :show, :edit, :update]
    resources :posts, only: [:show, :edit, :update, :destroy]
    resources :comments, only: [:index, :show, :update, :destroy]
    resources :tags, only: [:index, :create, :destroy]
  end

end
