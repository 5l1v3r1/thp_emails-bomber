require "awesome_print"
require "json"

file = File.read("db/emails.JSON")
array = municipalities = JSON.parse(file)

for departement in array
  puts "Pour le département de #{departement.keys[0]}, les mairies sont :".cyan
  for mairie in departement.values
    for final in mairie
      puts "L'adresse email de la mairie de #{final["name"].red} est : #{final["email"].red}".yellow
    end
  end
  puts "-----------------------"
end
