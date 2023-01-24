Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :update]
  namespace :cleaner do
    resources :bookings, only: :index
    # equivalent to => get '/cleaner/bookings', to: '<namespace>/bookings#index'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
