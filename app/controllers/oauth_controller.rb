class OauthController < ApplicationController
	require 'net/http'

	def authorize                                                                   
    options = {                                                                   
      site: 'https://slack.com/oauth/authorize'                                  
    }                                                                             
    client ||= OAuth2::Client.new(                                                
      '1732998281767.1750491674242', 
      '427a2aafa5337b6687ebca66c87839e9',                                                                                
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
  	puts 'no se esto que es'                                                    
    puts params["code"] 

   

    uri = URI('https://slack.com/api/oauth.access')
		res = Net::HTTP.post_form(uri, 'client_id' => '1732998281767.1750491674242', 'client_secret' => '427a2aafa5337b6687ebca66c87839e9', 'code' => params['code'])
		puts res.body
		rc = JSON.parse(res.body)
		puts '****'
		puts rc
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
