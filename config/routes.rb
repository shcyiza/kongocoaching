Rails.application.routes.draw do
  root to: 'kongo_coaching_pages#home'
  resources :kickstarts
  resources :profile_variables
  resources :profiles
  devise_for :users, controllers: { registrations: "kongo_coaching_pages/registrations" }
  resources :users
  resources :participants
  resources :trainings
  resources :training_types
  resources :coaches
  resources :crews

  get '/1/signup', to: 'kongo_coaching_pages#sign_up'
  get '/1/kickstarts/new', to: "kongo_coaching_pages#new_kickstart"

  post '/add_motivation', to: 'kickstarts#add_motivation'
  post '/after_kickstart_creation', to: 'kickstarts#after_creation_actions'

end
