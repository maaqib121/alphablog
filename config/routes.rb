Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles
  get "signup", to: "users#new"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :categories, except: [:destroy]

  namespace :api do
    namespace :v1 do
      post "login", to: "users#login"
      resources :articles, only: [:index, :create, :show]
    end
  end
end
