 require 'json'

class Converter

	def initialize
		file = File.read('db/emails.json')
		@email_hash = JSON.parse(file)

	end

	def perform
		# Retourne le array
		return @email_hash		
	end

	def return_names
			# Retourne le nom des villes de db/emails.json
			for city in @email_hash
			city_names = city["name"]
		end
	end


end

