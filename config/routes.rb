Rails.application.routes.draw do
  resources :news_subscribers
  resources :clubs
  if Rails.env.production?
    root to: 'visitors#index'
  else
    root to: 'kongo_coaching_pages#home'
  end

  resources :kickstarts
  resources :profile_variables
  resources :profiles
  devise_for :users, controllers: { registrations: "kongo_coaching_pages/registrations", omniauth_callbacks: "users/omniauth_callbacks" }, via: [:get, :post]
  resources :users
  resources :participants
  resources :trainings
  resources :training_types
  resources :coaches
  resources :crews

  get '/home', to: 'visitors#index'
  get '/edit_profile' , to: 'users#edit_profile'
  post '/update_profile', to: 'users#update_profile'

  get '/:crew_id/easy_register', to: 'easy_registration#sign_up'
  get '/:crew_id/easy_register/create_profile', to: 'easy_registration#create_profile'
  get '/:crew_id/easy_register/confirm_info', to: 'easy_registration#confirm_info'
  post '/:crew_id/easy_register/submit_profile', to: 'easy_registration#submit_profile'

  get 'crews/:id/kickstarts', to: 'crews#kickstarts'
  get 'crews/:id/planner', to: 'crews#planner'
  get 'crews/:id/coaches', to: 'crews#coaches'
  get 'crews/:id/services', to: 'crews#services'
  get 'crews/:id/clubs', to: 'crews#clubs'
  get 'crews/:id/clubs/new', to: 'crews#club_new'
  get 'crews/:id/clubs/:key', to: 'crews#club_show'

  get '/1/home', to: 'kongo_coaching_pages#home'
  get '/1/contact', to: 'kongo_coaching_pages#contact'
  get '/1/signup', to: 'kongo_coaching_pages#sign_up'
  get '/1/login', to: 'kongo_coaching_pages#login'
  get '/1/services', to: 'kongo_coaching_pages#services_index'
  get '/1/services/:id', to: 'kongo_coaching_pages#services_show'
  get '/1/coaches', to: 'kongo_coaching_pages#coaches_index'
  get '/1/coaches/:id', to: 'kongo_coaching_pages#coaches_show'
  get '/1/kickstarts/new', to: "kongo_coaching_pages#new_kickstart"
  get '/1/kickstarts/:id', to: "kongo_coaching_pages#show_kickstart"

  post '/add_motivation', to: 'kickstarts#add_motivation'
  post '/after_kickstart_creation', to: 'kickstarts#after_creation_actions'
  post 'crews/:id/admin_confirmation', to: 'kickstarts#admin_confirmation'

  post 'crews/:id/add_service', to: 'crews#add_service'
  post 'crews/:id/destroy_service/:key', to: 'crews#destroy_service'

  post 'crews/:id/destroy_cc/:key', to: 'crews#destroy_cc'
  post 'crews/:id/add_cc', to: 'crews#add_cc'
  post 'crews/:id/edit_cc/:key', to: 'crews#edit_cc'

  post 'crews/:id/add_club', to: 'crews#add_club'

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
