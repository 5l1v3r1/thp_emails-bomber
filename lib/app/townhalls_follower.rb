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


	def handle_maker

		 all_city_names = Converter.new.return_value("name", "email")
		
			@handle_list = [] 
		
			all_city_names.each do |to_handle|
				@handle_list << to_handle.to_s # Replace "Mairie de" with @ to get @ctiyname
			end
				
				return @handle_list	

	end


	def search_handle(research, i)
		# "Mairie de" + research.to_s)
	
			handle = @client.user_search(research.to_s).take(1)[i].screen_name
			return handle
			
	end

	def search_all_handle

			city_list = []
			notfound = "handle not found"		
			i = 0
		 
		for user in handle_maker
			research = user

			begin
			search = search_handle(research, i)

			rescue
			search = notfound
			end

			i += 1
			puts search
			
		end	
			
			
			
			
	end

			
			

			
		
			
			

	
				
			# rescue -> city_list << "handle not found"
			
			

		#end

		

		#puts handle_maker.zip(city_list).to_h


	

end