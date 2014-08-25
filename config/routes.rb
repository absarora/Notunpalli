Rails.application.routes.draw do
  
  # Devise
  # ------
  devise_for :users
  # as :user do
  #   get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #   put 'users' => 'devise/registrations#update', :as => 'user_registration'
  # end
  
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
  resources :photos, only: [:create, :destroy]
  match 'contents/gallery', to: 'photos#new_multiple', via: 'get'
  get 'photos/year_2013'
  get 'photos/year_2014'

  root to: 'welcomes#index'

end
