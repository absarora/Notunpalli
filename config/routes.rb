Rails.application.routes.draw do
  
  # Devise
  # ------
  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  # welcomes controller
  # -------------------
  get 'welcomes/index'
  # get 'welcomes/about'

  # contents controller
  # -------------------
  get 'contents/committee'
  # get 'contents/contact'
  get 'contents/donate'
  get 'contents/event'
  get 'contents/promote'
  # get 'contents/gallery'

  # contacts controller
  # -------------------
  match 'contents/contact',     to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  # photos controller
  # -----------------
  resources :photos, only: [:new, :create]
  match 'contents/gallery', to: 'photos#new_multiple', via: 'get'

  # Error Handling: Routing Error
  # -----------------------------
  match "*path", :to => "application#routing_error", :via => :all

  root to: 'welcomes#index'

end
