Rails.application.routes.draw do
  root 'countries#index'

  resources :countries, only: %i[index]

  devise_for :users
  devise_scope :user do
    delete  'logout', to: 'devise/sessions#destroy'
    get     'logout', to: 'devise/sessions#destroy'
  end
end
