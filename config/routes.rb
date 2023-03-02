Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  get 'prospects/:page', to: 'prospects#index'
  get 'prospects/edit/:id', to: 'prospects#edit'
  post 'prospects/edit/:id', to: 'prospects#update'
end
