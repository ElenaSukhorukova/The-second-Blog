Rails.application.routes.draw do
  get 'home/index'
  get 'home', to: 'home#index'
  root 'home#index'

  resources :articles

  resource :contacts, only: [:new, :create]
  get "/contacts", to: "contacts#new"
  post "/contacts", to: "contacts#create" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
