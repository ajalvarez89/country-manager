Rails.application.routes.draw do
  root 'countries#index'

  resources :countries
  # resources :countries, only: %i[index show update]

  devise_for :users
  devise_scope :user do
    delete  'logout', to: 'devise/sessions#destroy'
    get     'logout', to: 'devise/sessions#destroy'
  end
end
