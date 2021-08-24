Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
    devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root :to => 'homes#top'
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :genres,   only: [:index,:create,:edit,:update, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to     => "public/homes#top"
  get "/about" => "public/homes#about"
  resources :items, module: :public, :only => [:index,:show]
  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  get "/customers/my_page"     => "public/customers#show"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/withdraw"  => "public/customers#withdraw"

  resource :customers, module: :public, :only => [:edit, :update]

end
