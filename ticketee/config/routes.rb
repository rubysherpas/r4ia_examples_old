Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/show'

  root 'projects#index'
  get "/users/sign_up", to: "users#new", as: "sign_up"
  post "/users/sign_up", to: "users#create"
  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"

  resources :projects do
    resources :tickets
  end
end
