Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :genres,only: [:index,:create,:edit,:update, :show]
  end
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
