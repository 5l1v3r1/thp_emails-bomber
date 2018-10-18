require 'twitter'


class Follower

	def initialize
		# quelques lignes qui enregistrent les clés d'APIs
		@client = Twitter::REST::Client.new do |config|
			 config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
			 config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
			 config.access_token        = ENV['TWITTER_TOKEN']
			 config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']	
		end		 
	end


	def perform
		p @client
	end
	
end