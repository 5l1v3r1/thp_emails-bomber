 require 'json'

class Converter

attr_accessor :data_values


	def initialize
		file = File.read('db/emails.JSON')
		@data = JSON.parse(file)
		@data_names = []
		@data_title = []

	end

	def return_data
		# Retourne le array
		return @data		
	end

	def return_value(dataname, value)
			# Retourne le nom des villes de db/emails.json

			@data_names = []
			@data_values = []
			@data_title = []

				for data_title in @data 
					@data_title << data_title
					for data_name in data_title.values
						for data_value in data_name
							@data_names << data_value[dataname]
							@data_values << data_value[value]
						end
					end
				end	


			

			# puts @data_city
			return @data_names
	end

	def perform

	end


end

	