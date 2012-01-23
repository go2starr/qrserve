Qrserve::Application.routes.draw do
  get "store/index"

  resources :products
  resources :line_items

  root                 :to => 'store#index'
  


end

