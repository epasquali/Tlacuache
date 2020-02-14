Rails.application.routes.draw do
  

  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do  


    devise_for :users, skip: [:registrations], controllers: {confirmations: 'user/confirmations'}, 
                        path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register', 
                                               password: 'password', confirmation: 'account-activation'}
    
    devise_scope :user do      
      # registrations
      put    '/users/:id',  to: 'user/registrations#update'
      delete '/users/:id',  to: 'user/registrations#destroy'
      post   '/users/:id',  to: 'user/registrations#create'
      get    '/register', to: 'user/registrations#new',    as: :new_user_registration
      get    '/users/:id/edit',  to: 'user/registrations#edit',   as: :edit_user_registration
      patch  '/users/:id',  to: 'user/registrations#update', as: :user_registration
      get    '/users/:id/cancel', to: 'user/registrations#cancel', as: :cancel_user_registration 
      
    end


    resources :users, only: [:show]
    resources :listings
    resources :buys, controller:"listings", type:"Buy"
    resources :sells, controller:"listings", type:"Sell"
    resources :contactmsg, only: [:listing_contact]

    post '/contact', to: 'contacts#listing_contact'


    root 'listings#index'

    get '/about' => "pages#about"
    

  end #locale scope
  
end
