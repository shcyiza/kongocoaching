Rails.application.routes.draw do
  root to: 'crews#show', id: '1'
  resources :kickstarts
  resources :profile_variables
  resources :profiles
  devise_for :users
  resources :users
  resources :participants
  resources :trainings
  resources :training_types
  resources :coaches
  resources :crews
  get '/crews/:id/signup', to: 'crews#sign_up'
  get '/update_motivation', to: 'kickstarts#update_motivation'
  get "/after_kickstart_creation", to: 'kickstarts#after_kickstart_creation'

end
