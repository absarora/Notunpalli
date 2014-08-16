Rails.application.routes.draw do
  get 'welcomes/index'

  get 'welcomes/about'

  root to: 'welcomes#index'

end
