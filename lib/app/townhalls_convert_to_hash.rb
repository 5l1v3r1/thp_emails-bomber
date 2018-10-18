 require 'json'

class Converter

attr_accessor :data_values # ? Est-ce qu'on l'utilise?


	def initialize
		file = File.read('db/emails.JSON') #Cherche le fichier JSON
		@data = JSON.parse(file) # Parse le fichier JSON en array
		@data_names = [] # initialisation du array pour stocker les noms des villes
		# @data_title = [] 
	end

	def return_data
		# Retourne le array
		return @data		
	end

	def return_value(dataname, value) # Utilisé dans follower (dataname = "name", value = "email" <---- va chercher name & email dans emails.JSON)
			# Retourne le nom des villes de db/emails.json

			@data_names = [] #
			@data_values = []
			@data_title = [] # Département dans emails.JSON

				for data_title in @data # Dans le premier niveau du hash (département)
					@data_title << data_title # Envoyé le nom du département (nous ne l'utilisons pas dans ce programme mais on peut la return en cas de besoin)
					for data_name in data_title.values # Dans le deuxième niveau du hash (Valeurs dans département)
						for data_value in data_name # Troisieme niveau du tableau ("name",  "email")
							@data_names << data_value[dataname] #dataname = "name" --> appelé dans Follower.search_all_handle
							@data_values << data_value[value] 	#value = "email" --> "name" & "email" sont les selecteurs dans emails.JSON
						end
					end
				end				

			# puts @data_city
			return @data_names #Lorsqu'on appel la fonction dans Follower on a besoin de la valeur de "name"
								# Ici nous l'avons stocké dans un tableau 
								# On aurais aussi pu concatener les méthodes & return dans la loop 
	end

	def perform
		# 
	end


end

	