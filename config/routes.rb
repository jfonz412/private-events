Rails.application.routes.draw do
	root                	'sessions#new'
	get    '/signup',   to: 'users#new'
	get    '/profile',  to: 'users#show'
	get    '/login',    to: 'sessions#new'
	post   '/login',    to: 'sessions#create'
	delete '/logout',   to: 'sessions#destroy'
	resources :users,  only: [:new, :show, :create]
	resources :events, only: [:new, :create, :show, :index]
end
