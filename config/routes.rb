Rails.application.routes.draw do
  
  devise_for :users
  
  # welcomes controller
  # -------------------
  get 'welcomes/index'
  get 'welcomes/about'

  # contents controller
  # -------------------
  get 'contents/committee'
  get 'contents/contact'
  get 'contents/donate'
  get 'contents/event'
  get 'contents/promote'

  root to: 'welcomes#index'

end
