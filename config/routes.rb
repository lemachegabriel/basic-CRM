Rails.application.routes.draw do
  
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks'
  }

  get 'prospects', to: 'prospects#index'
  get 'prospects/:page', to: 'prospects#index'
  get 'prospects/edit/:id', to: 'prospects#edit'
  post 'prospects/create/', to: 'prospects#create'
  post 'prospects/edit/:id', to: 'prospects#update'
  delete 'prospects/:id', to: 'prospects#destroy'
  get 'prospect/new', to: 'prospects#new'
  
  get 'companies/:id', to: 'companies#index'
  get 'company/edit/:id', to: 'companies#edit'
  post 'company/edit/:id', to: 'companies#update'
  post 'company/create', to: 'companies#create'
  delete 'company/:id', to: 'companies#destroy'
  get 'company/new', to: 'companies#new'

  root to: 'prospects#index' 
end
