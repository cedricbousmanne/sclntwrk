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
  resources :members, only: [:index] do
    member do
      put :disable
      put :enable
    end
  end

  resource :profile, only: [:edit, :update]
  resources :posts, only: [:index, :create, :show] do
    resources :comments, only: [:create]
  end

  get "directory",              to: "directory#index",    as: :directory
  get "documents",              to: "documents#index",    as: :documents
  get "documents/:id",          to: "documents#show",     as: :document
  get "documents/:id/download", to: "documents#download", as: :download_document
  get "hashtags/:hashtag",      to: "hashtags#show",      as: :hashtag
  get "hashtags",               to: "hashtags#index",     as: :hashtags

end
