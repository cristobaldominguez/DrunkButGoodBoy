Rails.application.routes.draw do
  resources :blends
  resources :strains
  resources :wines

  root 'wines#index'
end
