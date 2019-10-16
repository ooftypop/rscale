Rails.application.routes.draw do

  authenticated :user do
    root to: "users#show"
  end

  root to: "static_pages#index"

  devise_for :users, controllers: {
    sessions:      "users/sessions",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    invitations:   "users/invitations"
  }

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :polls, except: [:new, :create]

    get '/remove_role', to: 'users#remove_role_link'
    get '/remove_user', to: 'users#delete_user_link'
  end

  resources :groups
  get  '/edit_user_emails',   to: 'groups#edit_user_emails'
  post '/change_users_group', to: 'groups#change_users_group'
  get  '/remove_user',        to: 'groups#remove_user_from_group_path'

  resources :polls
  resources :poll_options
  resources :votes

  # participants controller
  get  '/new_poll_roles',       to: 'participants#new_poll_roles'
  post '/create_poll_roles',    to: 'participants#create_poll_roles'

  get  '/add_groups',           to: 'participants#add_groups'
  post '/add_poll_groups',      to: 'participants#add_poll_groups'

  get '/remove_user_from_poll', to: 'participants#remove_user_from_poll'
end
