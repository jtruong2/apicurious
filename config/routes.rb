Rails.application.routes.draw do
  root 'sessions#new'

  get '/dashboard', to: 'dashboard#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
