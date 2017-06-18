Rails.application.routes.draw do
  resources :profile_variables
  resources :profiles
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :participants
  resources :trainings
  resources :training_types
  resources :coaches
  resources :crews
  get '/crews/:id/signup', to: 'crews#sign_up'

end
