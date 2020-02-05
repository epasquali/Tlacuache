Rails.application.routes.draw do
  
  resources :listings
  resources :buys, controller:"listings", type:"Buy"
  resources :sells, controller:"listings", type:"Sell"


  root 'listings#index'

  get '/about' => "pages#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
