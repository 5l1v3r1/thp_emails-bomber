require 'twitter'
require 'awesome_print'
require 'dotenv'
require_relative 'townhalls_convert_to_hash'

class Follower

	def initialize
		@client = Twitter::REST::Client.new do |config| #On initialise la connexion client
			#On donne nos clés API à Twitter pour pouvoir initialiser la connexion client
			Dotenv.load
			config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
			config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
			config.access_token        = ENV['TWITTER_TOKEN']
			config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
		end

	end

	def search_handle(research) #Recherche le premier utilisateur d'une recherche donnée
		#Ici, on affine les recherches 3 fois, d'abord avec mairie, sinon ville, sinon juste le nom de la mairie
		begin #On tente une recherche
			result = @client.user_search("mairie " + research)[0].screen_name #On enregistre le premier utilisateur de la recherche
		rescue NoMethodError #S'il n'a rien donné, on essaye quelque chose de moins pertinent
			begin
				result = @client.user_search("ville " + research)[0].screen_name #On enregistre le premier utilisateur de la recherche
			rescue NoMethodError #S'il n'a rien donné, on essaye quelque chose de moins pertinent
				begin
					result = @client.user_search(research)[0].screen_name #On enregistre le premier utilisateur de la recherche
				rescue NoMethodError #S'il n'a rien donné
					result = 'Aucun compte Twitter trouvé..' #On renvoie le malheureux message triste
				end
			end
		ensure
			return result
		end
	end

	def search_all_handle #Parcourt les noms de mairies
		not_found = "Aucun compte Twitter trouvé.." #On enregistre le message d'erreur par défaut pour gérer l'erreur plus tard
		array = Converter.new.return_value #Convertit le JSON en un array contenant les noms des mairies
		for municipality in array #Pour chaque mairie dans l'array
			handle_of_city = search_handle(municipality) #Enregistre le handle twitter de la mairie donnée
			puts "#{"Le handle Twitter de la mairie de".yellow} #{municipality.red} #{"est :".yellow} #{handle_of_city.red}"
			unless handle_of_city == not_found #A moins que le handle n'existe pas
				@client.follow(handle_of_city) #On s'y abonne
				puts "Abonnement à #{handle_of_city} fait !".green
			end
		end
	end

	def perform
		search_all_handle
	end
end
