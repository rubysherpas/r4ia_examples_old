Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  
  root 'projects#index'
  get "/users/sign_up", to: "users#new", as: "sign_up"
  post "/users/sign_up", to: "users#create"
  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"
  delete "/sign_out", to: "sessions#destroy"

  resources :projects do
    resources :tickets
  end
end
