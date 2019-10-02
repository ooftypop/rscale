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

  devise_scope :user do
    get   'sign_in', to: 'users/sessions#new'
    get   'sign_up', to: 'users/registrations#new'
    delete 'logout', to: 'users/sessions#destroy'
  end

  resources :forums
end
