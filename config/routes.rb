Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post'login', to:'authentication#login'

  get 'current_user_products', to:'products#current_user_products'

  get 'current_user_sold_products', to:'purchases#current_user_sold_products'
  
  get 'category_wise', to:'categories#category_wise_product'
  
  resource :users

  resources :products

  resources :purchases  

  resources :categories
end
