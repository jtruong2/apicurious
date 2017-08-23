Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/dashboard', to: 'dashboard#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/myaccount', to:'account#show', as: 'account'
  get '/myrepos', to: 'repositories#index'
end
