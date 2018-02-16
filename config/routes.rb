Rails.application.routes.draw do
	root 		"sessions#new"

  get	 		'/signup', to: 'users#new'
  post 		'/signup', to: 'users#create'

  get			'/login',  to: 'sessions#new'
  post		'/login',  to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  resources :users, 	 		only: [:new, :create, :show]
  resources :sessions, 		only: [:new, :create, :destroy]
  resources :events,	 		only: [:new, :create, :show, :index]
  resources :attendances,	only: [:create, :destroy]
end