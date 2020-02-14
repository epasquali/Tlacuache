Rails.application.routes.draw do
  

  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do  


    #devise_for :users, skip: [:sessions]
    devise_for :users, skip: [:sessions, :registrations, :passwords], controllers: {confirmations: 'users/confirmations'}
    #devise_for :users, skip: [:sessions, :registrations]
  
    #devise_for :users,
    #:path => "users",
    #:path_names => {
    #  :sign_in => 'login',
    #  :sign_out => 'logout',
    #  :password => 'password',
    #  :confirmation => 'activation',
    #  :unlock => 'unlock',
    #  :registration => 'registration',
    #  :sign_up => 'register' }
 

    devise_scope :user do
      
      # sessions
      get    '/login',  to: 'devise/sessions#new',     as: :new_user_session
      post   '/login',  to: 'devise/sessions#create',  as: :user_session
      delete '/logout', to: 'devise/sessions#destroy', as: :destroy_user_session
      
      # registrations
      put    '/users',  to: 'devise/registrations#update'
      delete '/users',  to: 'devise/registrations#destroy'
      post   '/users',  to: 'devise/registrations#create'
      get    '/register', to: 'devise/registrations#new',    as: :new_user_registration
      get    '/users/edit',  to: 'devise/registrations#edit',   as: :edit_user_registration
      patch  '/users',  to: 'devise/registrations#update', as: :user_registration
      get    '/users/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration 
  
      # passwords
      get   'forgot-password',  to: 'devise/passwords#new',    as: :new_user_password
      get   'users/password/edit', to: 'devise/passwords#edit',   as: :edit_user_password
      patch 'users/password', to: 'devise/passwords#update'
      put 'users/password', to: 'devise/passwords#update'
      post  'users/password',  to: 'devise/passwords#create', as: :user_password
    
    
    end


    resources :users, only: [:show]
    resources :listings
    resources :buys, controller:"listings", type:"Buy"
    resources :sells, controller:"listings", type:"Sell"


    root 'listings#index'

    get '/about' => "pages#about"
    

  end #locale scope
  
end
