require 'twitter'
# require_relative 'lib/app/townhalls_convert_to_hash'
require 'dotenv'
Dotenv.load
require_relative 'townhalls_convert_to_hash'
require 'pry'

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

	def search_handle(research)
		# "Mairie de" + research.to_s)
		begin
			result = @client.user_search("mairie " + research)[0].screen_name
		rescue NoMethodError
			begin
				result = @client.user_search("ville " + research)[0].screen_name
			rescue NoMethodError
				begin
					result = @client.user_search(research)[0].screen_name
				rescue NoMethodError
					result = 'No handle found.'
				end
			end
		ensure
			return result
		end
	end

	def search_all_handle

		city_list = []
		notfound = "handle not found"
		i = 0

		array = all_city_names = Converter.new.return_value("name", "email")
		for user in array
			puts "Le handle Twitter de la mairie de #{user} est : #{search_handle(user)}"
		end
	end
end
