Rails.application.routes.draw do
	get '/signup',  to: 'users#new'
	get '/profile', to: 'users#show'
	resources :users, only: [:new,:show]
end
