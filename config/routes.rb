Rails.application.routes.draw do

  authenticated :user do
    root to: "users#show"
  end

  root to: "static_pages#index"

  devise_for :users, controllers: {
    sessions:      "users/sessions",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  resources :polls
  get  '/new_participants',    to: 'polls#new_participants'
  post '/create_participants', to: 'polls#create_participants'

  resources :poll_options
  resources :votes
end
