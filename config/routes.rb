Rails.application.routes.draw do
    resources :users
    resources :posts
    resources :categories
    resources :post_categories
    resources :category_indexes
    get  '/signup',  to: 'users#new'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    root 'posts#index'
end
