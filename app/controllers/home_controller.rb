class HomeController < ApplicationController
	require 'net/http'
	before_action :authenticate_user!

	def index
		@current_user = current_user

		Slack.configure do |config|
			  config.token = "xoxb-1732998281767-1756676392564-t5TReKTOSQwUUWZXe0J5eylV"
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

			client.on :message do |data|
			  case data.text
			  when 'bot hi' then
			  	NumbersJob.perform_later data.text
			    client.message(channel: data.channel, text: "Hi <@#{data.user}>!")
			  when /^bot/ then
			    client.message(channel: data.channel, text: "Sorry <@#{data.user}>, what?")
			  when String  then
			  	c = Utility.new
			  	puts c.get_prime_numbers(data.text.to_i)
			  	client.message(channel: data.channel, text: "necesito un numero")
			  end
			end

			client.on :close do |_data|
			  puts "Client is about to disconnect"
			end

			client.on :closed do |_data|
			  puts "Client has disconnected successfully!"
			end

			client.start_async
		
	end
end
