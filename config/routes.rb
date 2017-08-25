Rails.application.routes.draw do
  resources :clubs
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

  get 'crews/:id/kickstarts', to: 'crews#kickstarts'
  get 'crews/:id/planner', to: 'crews#planner'
  get 'crews/:id/coaches', to: 'crews#coaches'
  get 'crews/:id/services', to: 'crews#services'

  get '/1/signup', to: 'kongo_coaching_pages#sign_up'
  get '/1/login', to: 'kongo_coaching_pages#login'
  get '/1/kickstarts/new', to: "kongo_coaching_pages#new_kickstart"
  get '/1/kickstarts/:id', to: "kongo_coaching_pages#show_kickstart"

  post '/add_motivation', to: 'kickstarts#add_motivation'
  post '/after_kickstart_creation', to: 'kickstarts#after_creation_actions'
  post 'crews/:id/admin_confirmation', to: 'kickstarts#admin_confirmation'
  post 'crews/:id/add_service', to: 'crews#add_service'
  post 'crews/:id/add_cp', to: 'crews#add_cp'

end
