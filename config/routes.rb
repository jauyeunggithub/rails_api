Rails.application.routes.draw do
  get 'posts/create'
  get 'posts/show'
  get 'comments/create'
  get 'comments/show'
  get 'images/create'
  get 'images/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :posts, only: [:create, :show] do
    resources :comments, only: [:create, :show]
  end

  resources :images, only: [:create, :show] do
    resources :comments, only: [:create, :show]
  end
end
