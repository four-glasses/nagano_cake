Rails.application.routes.draw do
  
  
  get 'orders/index'
  get 'orders/show'
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
   root :to => 'homes#top'
  resources :items, only: [:show, :index, :new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :update]
  resources :order_details, only: [:update]
  end
  
end
