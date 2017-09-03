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
  get '/1/services', to: 'kongo_coaching_pages#services_index'
  get '/1/services/:id', to: 'kongo_coaching_pages#services_show'
  get '/1/kickstarts/new', to: "kongo_coaching_pages#new_kickstart"
  get '/1/kickstarts/:id', to: "kongo_coaching_pages#show_kickstart"

  post '/add_motivation', to: 'kickstarts#add_motivation'
  post '/after_kickstart_creation', to: 'kickstarts#after_creation_actions'
  post 'crews/:id/admin_confirmation', to: 'kickstarts#admin_confirmation'
  post 'crews/:id/add_service', to: 'crews#add_service'
  post 'crews/:id/destroy_cc/:key', to: 'crews#destroy_cc'
  post 'crews/:id/add_cc', to: 'crews#add_cc'
  post 'crews/:id/edit_cc/:key', to: 'crews#edit_cc'
  post 'crews/:id/destroy_service/:key', to: 'crews#destroy_service'
  post 'crews/:id/destroyvid/:media_id', to: 'multimedia#destroy_videolink'
  post 'crews/:id/destroypic/:media_id', to: 'multimedia#destroy_picture'
  post 'crews/:id/setdefaultpic/:media_id', to: 'multimedia#make_this_pic_default'
  post 'crews/:id/setdefaultvid/:media_id', to: 'multimedia#make_this_vid_default'
  #those routes is so complicated to keep it polymorphic, therefore the class names and the id of the polymorphic owner had to be passed as wel
  post 'crews/:id/add_avatar/:attachable_type/:key', to: 'multimedia#add_avatar'
  post 'crews/:id/add_videolink/:watchable_type/:key', to: 'multimedia#add_videolink'

  post 'crews/:id/edit_avatar/:media_id', to: 'multimedia#update_this_pic'
  post 'crews/:id/edit_video/:media_id', to: 'multimedia#update_this_vid'
end
