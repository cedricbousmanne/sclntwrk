CommunityGreenlabCoworking::Application.routes.draw do

  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end
  unauthenticated do
    root 'pages#index'
  end

  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  resources :assets, only: [:create, :show]
  resources :communities
  resources :users, only: [:show]

  resource :profile, only: [:edit, :update]
  resources :posts, only: [:index, :create, :show] do
    resources :comments, only: [:create]
  end

  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags

end
