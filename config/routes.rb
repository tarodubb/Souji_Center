Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :bookings, only: [:index, :new, :create, :show]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
