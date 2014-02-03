CommunityGreenlabCoworking::Application.routes.draw do


  root 'pages#index'

  devise_for :users

  resource :profile, only: [:edit, :update]

  resources :communities do
    resources :posts, only: [:index, :create]
    get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
    get "hashtags",            to: "hashtags#index",     as: :hashtags
  end

end
