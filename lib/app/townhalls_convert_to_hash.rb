require 'json'

class Converter

	def initialize
		file = File.read('db/emails.JSON') #Cherche le fichier JSON
		@data = JSON.parse(file) #Extrait l'array du fichier JSON
	end

	def return_value # Utilisé dans follower (dataname = "name", value = "email" <---- va chercher name & email dans emails.JSON)
			# Retourne le nom des villes de db/emails.json

			@data_names = [] #Initialisation du array pour stocker les noms des villes

				for data_title in @data # Dans le premier niveau du hash (département)
					for data_name in data_title.values # Dans le deuxième niveau du hash (Valeurs dans département)
						for data_value in data_name # Troisieme niveau du tableau ("name",  "email")
							@data_names << data_value["name"] #dataname = "name" --> appelé dans Follower.search_all_handle
						end
					end
				end

			return @data_names #Lorsqu'on appelle la fonction dans Follower on a besoin de la valeur de "name"
	end
end
