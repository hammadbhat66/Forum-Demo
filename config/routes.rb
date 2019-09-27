Rails.application.routes.draw do
  get 'forums/index'
  devise_for :users
  root 'home#index'
  resources :forums do
  	resources :comments, only: [:update,:create,:edit,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
