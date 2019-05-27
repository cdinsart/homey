Rails.application.routes.draw do
  get 'desks/my_desks'
  get 'desks/index'
  get 'desks/show'
  get 'desks/new'
  get 'desks/create'
  get 'desks/edit'
  get 'desks/update'
  get 'desks/destroy'
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
