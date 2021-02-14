class SessionsController < ApplicationController
	# If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only. 
  skip_before_action :verify_authenticity_token, only: :create

  def create
      c = auth_hash
      puts 'hash'
      request.env['omniauth.auth']
      puts c
     redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
