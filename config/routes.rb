Rails.application.routes.draw do
  get '/my_desks', to: 'desks#my_desks'
  devise_for :users
  resources :users, only: [:show]
  resources :desks do
    resources :desk_features, only: [:create, :destroy]
    resources :photos, only: [:create, :index]
  end
  resources :photos, only: [:destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
