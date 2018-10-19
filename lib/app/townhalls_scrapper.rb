require "nokogiri"
require "open-uri"
require "awesome_print"
require "json"

class Scrapp_All
  PAGE_URL1 = "http://annuaire-des-mairies.com/loire-atlantique.html"
  PAGE_URL2 = "http://annuaire-des-mairies.com/haute-corse.html"
  PAGE_URL3 = "http://annuaire-des-mairies.com/seine-saint-denis.html"

  def initialize
    @file = File.open("db/emails.JSON", "w")
  end

  def get_the_email_of_a_townhal_from_its_webpage(page) #Récupère l'email de la mairie du lien donné
    page = Nokogiri::HTML(open(page))
    text = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text #Récupère l'email
    if text != "" #Si il y a un email
      return text #Le retourner
    else
      return "AUCUN EMAIL" #Retourner "AUCUN EMAIL"
    end
  end

  def get_all_the_urls(page, sublink, departement_name) #Récupére les liens des mairies
    url = page.chomp(sublink) #On garde juste la racine du lien
    page = Nokogiri::HTML(open(page))
    count = 0.0
    municipalities = []
    page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css

      municipalities << {"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}
      #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
      #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
      print "Scrapping de #{departement_name}: #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red}#{")".yellow}               \r".yellow
      #On fait un pourcentage de progression grâce à un produit en croix
      count += 1
    end
    @file.puts(JSON.generate("#{departement_name}" => municipalities)) #On enregistre dans le JSON toutes les mairies du département concerné
  end

  def perform
    @file.puts("[")
    get_all_the_urls(PAGE_URL1, "loire-atlantique.html", "Loire Atlantique")
    @file.puts(",")
    get_all_the_urls(PAGE_URL2, "haute-corse.html", "Haute Corse")
    @file.puts(",")
    get_all_the_urls(PAGE_URL3, "seine-saint-denis.html", "Seine St-Denis")
    @file.puts("]")
    @file.close
  end
end
