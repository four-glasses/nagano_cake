Rails.application.routes.draw do

  devise_for :admins
  namespace :admin do
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
