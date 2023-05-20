Rails.application.routes.draw do
  devise_for :doctors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "doctors#index"
  resources :doctors, only: [:index, :show] do
    get 'appointments', on: :member
    patch 'update_recommendation', on: :member
  end
  resources :categories, only: [:index, :show]
  resources :appointments, only: [:new, :create]

end
