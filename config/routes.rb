Rails.application.routes.draw do
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
