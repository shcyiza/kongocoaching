Rails.application.routes.draw do
  root to: 'crews#show', id: '1'
  resources :kickstarts
  resources :profile_variables
  resources :profiles
  devise_for :users, controllers: { registrations: "crews/registrations" }
  resources :users
  resources :participants
  resources :trainings
  resources :training_types
  resources :coaches
  resources :crews
  get '/crews/:id/signup', to: 'crews#sign_up'
  post '/add_motivation', to: 'kickstarts#add_motivation'
  post '/after_kickstart_creation', to: 'kickstarts#after_creation_actions'

end
