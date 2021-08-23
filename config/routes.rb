Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "public/homes#top"
  get "/about" => "public/homes#about"
  resources :items, module: :public, :only => [:index,:show]
  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

end
