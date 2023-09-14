Rails.application.routes.draw do
  resources :genres
  root "movies#index"
  
  resources :movies do
    resources :reviews
    resources :favs, only: [:create, :destroy]
  end

  get "movies/filter/:filter" => "movies#index", as: :movie_filter
  
  resources :users
  get "signup" => "users#new"
  
  resource :session, :only => [:new, :create, :destroy]
  get "signin" => "sessions#new"

end