Raptor::Application.routes.draw do
  resources :experiments
  resources :variations
  resources :changes

  root :to => 'experiments#index'

  match 'admin', to: 'experiments#index', via: 'get'
end
