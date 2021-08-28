Rails.application.routes.draw do

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
    resources :order_item, only: [:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :genres,   only: [:index,:create,:edit,:update, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root :to     => "public/homes#top"
  get "/about" => "public/homes#about"
  resources :items, module: :public, :only => [:index,:show]

  get "/customers/my_page"     => "public/customers#show"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/withdraw"  => "public/customers#withdraw"

<<<<<<< HEAD
  resources :orders, module: :public, :only => [:index,:create,:new,:show]do
   collection do
    post :comfirm
    get :complete
  end
 end

  resources :cart_items, module: :public, :only => [:index,:create,:update,:destroy]do
   collection do
   delete :destroy_all
   end
  end
=======
  resources :orders, module: :public, :only => [:index,:create,:new,:comfirm,:show,:complete]

  resources :cart_items, module: :public, :only => [:index,:create,:update,:destroy,:destroy_all]
>>>>>>> 7cd935b700178ae67940f747e008b14d69e3c8f3

  resource :customers, module: :public, :only => [:edit, :update]

  resources :deliveries, module: :public, :only => [:index,:create,:edit,:update,:destroy]

 devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

end