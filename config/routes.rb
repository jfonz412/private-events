Rails.application.routes.draw do
	root                	'sessions#new'
	get    '/signup',   to: 'users#new'
	post   '/signup',   to: 'users#create'
	get    '/profile',  to: 'users#show'
	get    '/login',    to: 'sessions#new'
	post   '/login',    to: 'sessions#create'
	delete '/logout',   to: 'sessions#destroy'
	get    '/invite',    to: 'users#index'
	resources :users,  only: [:new, :show, :create]
	resources :events, only: [:new, :create, :show, :index]
end
