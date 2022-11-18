Rails.application.routes.draw do
  devise_for :users
  root "splash#index"
  resources :groups do
    resources :entities, only: [:new, :create, :edit, :update]
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
