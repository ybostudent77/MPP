Rails.application.routes.draw do
  devise_for :users
  resources :patient_cards
  resources :patients
  resources :doctors
  resources :specializations
  resources :departments
  root "root#index"
end
