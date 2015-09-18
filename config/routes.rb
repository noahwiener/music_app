Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, only: [:create, :edit, :show, :update, :destroy]
  # resources :tracks
  resource :session, only: [:new, :create, :destroy]


end
