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
  end

  resources :polls
  get  '/new_participants',    to: 'polls#new_participants'
  post '/create_participants', to: 'polls#create_participants'

  get  '/add_groups',          to: 'polls#add_groups'
  post '/create_poll_groups',  to: 'polls#create_poll_groups'

  get '/remove_user_from_poll', to: 'polls#remove_user_from_poll'

  resources :groups
  get  '/edit_user_emails',   to: 'groups#edit_user_emails'
  post '/change_users_group', to: 'groups#change_users_group'
  get  '/remove_user',        to: 'groups#remove_user_from_group_path'

  resources :poll_options
  resources :votes
end
