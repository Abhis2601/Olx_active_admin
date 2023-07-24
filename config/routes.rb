Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resource :users do 
    post 'login', on: :collection 
  end

  resources :products do
    get'current_user_products', on: :collection
  end

  resources :purchases  do 
    get 'current_user_sold_products', on: :collection
  end

  resources :categories do
    get 'category_wise', on: :collection
  end
end
