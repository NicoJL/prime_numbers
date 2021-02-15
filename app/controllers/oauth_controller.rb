class OauthController < ApplicationController
	require 'net/http'

	def authorize                                                                   
    options = {                                                                   
      site: 'https://slack.com/oauth/authorize'                                  
    }                                                                             
    client ||= OAuth2::Client.new(                                                
       ENV['CLIENT_ID'],
       ENV['CLIENT_SECRET'],                                                                          
      options                                                                     
    )                                                                             
    params = {                                                                    
      scope: 'client',    
      # incoming-webhook, commands                                    
      redirect_uri: 'http://localhost:3000/oauth/callback'                       
    }                                                                             
    redirect_to client.auth_code.authorize_url(params)                            
  end                                                                             

  def authorize_callback      
    uri = URI('https://slack.com/api/oauth.access')
		res = Net::HTTP.post_form(uri, 'client_id' => ENV['CLIENT_ID'], 'client_secret' =>  ENV['CLIENT_SECRET'], 'code' => params['code'])
		rc = JSON.parse(res.body)
		rc['access_token']
   	
   	begin

			Slack.configure do |config|
			  config.token = rc['access_token']
			end

			client = Slack::Web::Client.new
			client.auth_test
			# client.chat_postMessage(channel: '#general', text: 'nueva app')

			
			client = Slack::RealTime::Client.new

			client.on :hello do
			  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
			end

			client.on :message do |data|
			  case data.text
			  when 'bot hi' then
			    client.message(channel: data.channel, text: "Hi <@#{data.user}>!")
			  when /^bot/ then
			    client.message(channel: data.channel, text: "Sorry <@#{data.user}>, what?")
			  end
			end

			client.on :close do |_data|
			  puts "Client is about to disconnect"
			end

			client.on :closed do |_data|
			  puts "Client has disconnected successfully!"
			end

			client.start!
			
		rescue Slack::Web::Api::Errors::SlackError => e
			puts 'Error'
			puts e.message
		end

    # redirect_to root_url                                                              
  end 
end
