Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  # get 'users/index'
 
  # get "/users/:id" => "users#show"
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_post'
  # post 'users', to: 'users#create'
  # patch "/users/:id" => "users#update"
  devise_for :users
  resources :users 
  resources :posts
  get :toppage, to: 'toppage#index'
  get :mypage, to: 'mypage#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "users#index"
end
