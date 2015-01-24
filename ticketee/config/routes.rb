Rails.application.routes.draw do
  get 'assets/show'

  namespace :admin do
    root 'base#index'

    resources :projects, only: [:new, :create, :destroy]
    resources :users
  end

  devise_for :users
  root 'projects#index'

  resources :projects, only: [:index, :show, :edit, :update] do
    resources :tickets
  end

  resources :assets, only: [:show, :new], path: :files
end
