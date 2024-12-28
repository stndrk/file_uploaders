# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions",
    passwords:     "users/passwords"
  }

  root "home#index"

  get "uploaded_files/share", to: "uploaded_files#share", as: "share_uploaded_file"

  post "uploaded_files/send_file_email", to: "uploaded_files#send_file_email", as: "send_file_email"

  resource :dashboard, only: [:show]

  authenticated :user do
    resources :uploaded_files, only: %i[new create index destroy] do
      member do
        get :share
      end
    end
  end

  resources :files, only: %i[create destroy]
end
