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

  # contents controller
  # -------------------
  get 'contents/committee'
  get 'contents/event'
  get 'contents/promote'
  # get 'contents/gallery'

  # contacts controller
  # -------------------
  match 'contents/contact', to: 'contacts#new', via: 'get'
  resources 'contacts', only: [:new, :create]

  # photos controller
  # -----------------
  resources :photos, only: [:create, :destroy]
  match 'contents/gallery', to: 'photos#new_multiple', via: 'get'

  root to: 'welcomes#index'

end
