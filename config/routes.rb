Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :positions
  resources :position_histories
  resources :employment_terms do
    patch :update_end_date, on: :member
  end
  resources :position_histories
end
