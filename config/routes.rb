Rails.application.routes.draw do
  #会員側 パスワード変更のルーティングを削除し、登録・ログイン用のルーティングを設定
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者側 パスワード変更・登録のルーティングを削除し、ログイン用のルーティングを設定
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "homes#top"
    #get members/confirm をresources:memberの前に記載すると会員情報編集画面→退会確認画面へのリンクにエラーが生じる("confirm"をidと認識してしまう)
    get 'members/confirm' => 'members#confirm'
    patch 'members/leave' => 'members#leave'
    resources :members, only: [:show, :edit, :update]
    resources :posts, only: [:index, :new, :show, :edit, :update, :create] do
      resources :comments, only: [:new, :create, :destroy]
      resources :bookmarks, only: [:create, :destroy]
    end
    get 'searches' => 'searches#search'
  end

  namespace :admin do
    root :to => "homes#top"
    resources :members, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
    resources :comments, only: [:index, :show, :update, :destroy]
    resources :tags, only: [:index, :create, :destroy]
  end

end
