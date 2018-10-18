 require 'json'

class Converter

attr_accessor
	def initialize
		file = File.read('db/emails.JSON')
		@data = JSON.parse(file)


	end

	def perform
		# Retourne le array
		return @data		
	end

	def return_value(dataname, value)
			# Retourne le nom des villes de db/emails.json

			@data_names = []
			@data_values = []

				for data_title in @data
					for data_name in data_title.values
						for data_value in data_name
							@data_names << data_value[dataname]
							@data_values << data_value[value]
						end
					end
				end	

			
			#puts @data_names
			#puts @data_values


			#@data_city = Hash[@data_names.zip(@data_values)]
			# => {"Strasbourg"=>"Strasbourg@gmail.com", "Mulhouse"=>"mulhouse@gmail.com", "Paris"=>"paris@gmail.com", "Lille"=>"lille@gmail.com", "Rouen"=>"rouen@gmail.com", "Marseille"=>"marseille@gmail.com"}

			# @data_city = @data_names.zip(@data_values)

			puts @data_city
			#return @data_city
	end


end

	