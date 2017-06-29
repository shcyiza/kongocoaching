Rails.application.routes.draw do
  resources :kickstarts
  resources :profile_variables
  resources :profiles
  root to: 'crews#show', id: '1'
  devise_for :users, controllers: { registrations: "crews/registrations" }
  resources :users

  resources :participants
  resources :trainings
  resources :training_types
  resources :coaches
  resources :crews
  get '/crews/:id/signup', to: 'crews#sign_up'
  patch '/addmotivation/:id', to: 'profiles#update'

end
