Rails.application.routes.draw do
  
  # Devise
  # ------
  devise_for :users
  
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
  get 'contents/gallery'

  # contacts controller
  # -------------------
  match 'contents/contact',     to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  root to: 'welcomes#index'

end
