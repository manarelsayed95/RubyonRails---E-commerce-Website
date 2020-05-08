Rails.application.routes.draw do
  get 'carts/show'
  devise_for :admin_users,ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stores
  resources :order_products
  resources :orders
  resources :products
  devise_for :users

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  get 'welcome/index'
  root 'welcome#index' 
  resources :brands
  resources :categories
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end