Rails.application.routes.draw do
  root 'topics#index'

  devise_for :users
  resources :topics do
  	resources :comments
  end
  resources :users, only: [:show, :edit, :update]

end
