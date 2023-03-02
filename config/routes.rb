Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  get 'prospects/:page', to: 'prospects#index'
  get 'prospects/edit/:id', to: 'prospects#edit'
  post 'prospects/edit/:id', to: 'prospects#update'
  delete 'prospects/:id', to: 'prospects#destroy'
  
  get 'company/:id', to: 'companies#index'
  get 'company/edit/:id', to: 'companies#edit'
  post 'company/edit/:id', to: 'companies#update'
  delete 'company/:id', to: 'companies#destroy'

  root to: 'prospects#index' 
end
