Qrserve::Application.routes.draw do

  resources :orders

  resources :users do
    resources :orders, :action => :list
  end
  resources :products
  resources :line_items
  resources :sessions, :only => [:new, :create, :destroy]
  resources :carts, :only => [:new, :show]


  get "store/index"

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout',:to => 'sessions#destroy'
  match '/secret', :to => 'sessions#secret'

  root             :to => 'store#root'




end

