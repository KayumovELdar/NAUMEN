# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :positions
  resources :employment_terms do
    patch :update_end_date, on: :member
  end
end
