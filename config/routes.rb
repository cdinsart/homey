Rails.application.routes.draw do
  get '/my_desks', to: 'desks#my_desks'
  devise_for :users
  resources :users, only: :show
  patch '/bookings/:id/approved', to: 'bookings#approved', as: 'approved'
  patch '/bookings/:id/denied', to: 'bookings#denied', as: 'denied'
  resources :desks do
    resources :desk_features, only: [:index, :new, :create]
    resources :photos, only: [:create, :index]
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :show
  end
  resources :desk_features, only: [:destroy, :edit, :update]
  resources :photos, only: [:destroy]
  resources :bookings, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
