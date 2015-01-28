Raptor::Application.routes.draw do
  resources :experiments
  root :to => 'experiments#index'

  match 'admin', to: 'experiments#index', via: 'get'
end
