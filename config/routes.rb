Rails.application.routes.draw do
  get 'home/index'
  get 'home', to: 'home#index'
  root 'home#index'

  resources :articles

  resource :contacts, only: [:new, :create], path_names: { :new => '' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
