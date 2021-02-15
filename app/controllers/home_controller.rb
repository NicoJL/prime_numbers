class HomeController < ApplicationController
	require 'net/http'
	before_action :authenticate_user!

	def index
		begin
			@current_user = current_user
		
			Slack.configure do |config|
			  config.token = ENV['TOKEN_API']
			end

			client = Slack::Web::Client.new
			client.auth_test
			# client.chat_postMessage(channel: '#general', text: 'nueva app')

			Slack::RealTime.configure do |config|
			  config.concurrency = Slack::RealTime::Concurrency::Async
			end

			client = Slack::RealTime::Client.new

			client.on :hello do
			  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
			end

			c = Utility.new

			client.on :message do |data|
			  case 
			  
			  when data.text.match(/\A[+-]?\d+\z/)  then	
			  	is_prime =  c.get_prime_numbers(data.text.to_i)
			  	NumbersJob.perform_later is_prime,data.text
			  	client.message(channel: data.channel, text: "ok lets get it!")
		  	when data.text.match(/[a-zA-Z]/) 
		  		client.message(channel: data.channel, text: "I need a number")
			  end
			end

			client.on :close do |_data|
			  puts "Client is about to disconnect"
			end

			client.on :closed do |_data|
			  puts "Client has disconnected successfully!"
			end

			client.start_async
		rescue Slack::Web::Api::Errors::SlackError => e
			puts 'Error'
			puts e.message
		end
	end
end
