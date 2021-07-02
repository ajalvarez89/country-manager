Rails.application.routes.draw do
  root 'countries#index'

  resources :countries, only: %i[index]
end
