Qrserve::Application.routes.draw do
  get "users/new"

  get "store/index"

  resources :products
  resources :line_items

  root                 :to => 'store#index'
  


end

