Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :profile do
    get 'myprofiles/index'
  end
  get 'forums/index'
  devise_for :users
  root 'home#index'
  resources :forums do
  	resources :comments, only: [:update,:create,:edit,:destroy]
  end
  namespace :profile do
    get "profile", to: "myprofiles#index"
    get "show", to: "myprofiles#show"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
