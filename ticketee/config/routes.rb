Rails.application.routes.draw do
  root 'projects#index'
  get "/users/sign_up", to: "users#new", as: "sign_up"
  post "/users/sign_up", to: "users#create"

  resources :projects do
    resources :tickets
  end
end
