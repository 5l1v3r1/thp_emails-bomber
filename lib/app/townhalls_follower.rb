require 'twitter'
# require_relative 'lib/app/townhalls_convert_to_hash'

require_relative 'townhalls_convert_to_hash'

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


	def use_data

		all_city_names = Converter.new.return_value("name", "email")
		
			@handle = [] 
		
			all_city_names.each do |to_handle|
				@handle << ("Maire de " + to_handle).to_s # Replace "Mairie de" with @ to get @ctiyname
			end

		# first = @handle.first ???????

		# puts @handle

	end


	def search_handle


	end
end