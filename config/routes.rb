Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home', to: 'home#index'
  root to: "home#index"

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  resources :articles do
    resources :comments, only: [:create]
  end

  resource :contacts, only: [:new, :create], path_names: { :new => '' }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
