Rails.application.routes.draw do
  
  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do  
    resources :listings
    resources :buys, controller:"listings", type:"Buy"
    resources :sells, controller:"listings", type:"Sell"


    root 'listings#index'

    get '/about' => "pages#about"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  end
  
end
