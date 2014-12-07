Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  devise_for :users
  root 'projects#index'

  resources :projects do
    resources :tickets
  end
end
