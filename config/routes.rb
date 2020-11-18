Rails.application.routes.draw do


  resources :interventions
  get 'geolocation/index'
 

  mount RailsAdmin::Engine => '/backoffice', as: 'rails_admin'
  


  resources :leads
  resources :quotes , only: [:user_quotes, :new, :create]
 # resources :interventions , only: [:new, :create]


  root to: 'static_pages#index'
  get 'static_pages/residential'
  get 'static_pages/corporate'
  get 'static_pages/intervention'

  devise_for :users,
  :controllers => { registrations: 'registrations'},
  :path_prefix => '',
  path: 'u',
  path_names: {
    sign_in: 'sign_in',
    sign_out: 'sign_out',
    password: 's',
    confirmation: 'v'
  }

  get 'my_quotes' => 'quotes#user_quotes', as: :my_quotes
  get 'my_leads' => 'leads#user_leads', as: :my_leads

  match '/watson' => 'watson#speak', via: :get

end
