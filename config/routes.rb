Rails.application.routes.draw do
  resources :prime_number_befores
  resources :prime_numbers
  devise_for :users, controllers: {
		sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/auth/slack/callback', to: 'sessions#create'

  get '/authorize', to: 'oauth#authorize'                                       
	get '/oauth/callback', to: 'oauth#authorize_callback'  
end
