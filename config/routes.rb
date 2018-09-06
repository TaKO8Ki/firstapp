Rails.application.routes.draw do
    get 'follows/create'
    get 'follows/destroy'
    get 'likes/create'
    get 'likes/destroy'
    resources :users do
        member do
            get :following, :followers
        end
    end
    resources :posts do
        resources :likes, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
    end
    resources :categories
    resources :post_categories
    resources :category_indexes
    resources :post_users
    resources :likes
    resources :follows, only: [:create, :destroy]
    get  '/signup',  to: 'users#new'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    root 'posts#index'
end
