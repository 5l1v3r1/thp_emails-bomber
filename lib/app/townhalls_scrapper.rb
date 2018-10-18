  require "nokogiri"
  require "open-uri"
  require "awesome_print"
  require "json"



class Scrapp_All

  class Scrapper_Loire_Atl
    PAGE_URL = "http://annuaire-des-mairies.com/loire-atlantique.html"
    #Récupère le contenu HTML du lien donné

    def get_the_email_of_a_townhal_from_its_webpage(page) #Récupère l'email de la mairie du lien donné
      page = Nokogiri::HTML(open(page))
      text = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text #Récupère l'email
      if text != "" #Si il y a un email
        return text #Le retourner
      else #Sinon
        return "AUCUN EMAIL" #Retourner "AUCUN EMAIL"
      end
    end

    def get_all_the_urls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("loire-atlantique.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
      count = 0.0
      file = File.open("db/emails.JSON", "w")

      tabl = []

      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css

        tabl << {"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Loire Atlantique : #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      #the_hash = ["loire_atlantique" => prout]
      file.puts("[")
      file.puts(JSON.generate("Loire Atlantique" => tabl))
      file.puts(",")
      return municipalities #On retourne tous les hashs des villes
    end
    def perform
      municipalities = get_all_the_urls(PAGE_URL)
    end
  end







  class Scrapper_Haute_Corse
    PAGE_URL = "http://annuaire-des-mairies.com/haute-corse.html"
    #Récupère le contenu HTML du lien donné

    def get_the_email_of_a_townhal_from_its_webpage(page) #Récupère l'email de la mairie du lien donné
      page = Nokogiri::HTML(open(page))
      text = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text #Récupère l'email
      if text != "" #Si il y a un email
        return text #Le retourner
      else #Sinon
        return "AUCUN EMAIL" #Retourner "AUCUN EMAIL"
      end
    end

    def get_all_the_urls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("haute-corse.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
      count = 0.0
      file = File.open("db/emails.JSON", "a")

      tabl_1 = []

      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css

        tabl_1 << {"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Haute Corse : #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      file.puts(JSON.generate("Haute Corse" => tabl_1))
      file.puts(",")
      #the_hash = ["loire_atlantique" => prout]
      return municipalities #On retourne tous les hashs des villes
    end

    def perform

      municipalities = get_all_the_urls(PAGE_URL)
    end
  end









  class Scrapper_Seine_St_Denis
    PAGE_URL = "http://annuaire-des-mairies.com/seine-saint-denis.html"
    #Récupère le contenu HTML du lien donné

    def get_the_email_of_a_townhal_from_its_webpage(page) #Récupère l'email de la mairie du lien donné
      page = Nokogiri::HTML(open(page))
      text = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text #Récupère l'email
      if text != "" #Si il y a un email
        return text #Le retourner
      else #Sinon
        return "AUCUN EMAIL" #Retourner "AUCUN EMAIL"
      end
    end

    def get_all_the_urls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("seine-saint-denis.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
       count = 0.0
      file = File.open("db/emails.JSON", "a")
      tabl_2 = []
      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css

        tabl_2 << {"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Seine St Denis: #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      #the_hash = ["loire_atlantique" => prout]
          file.puts(JSON.generate("Seine St Denis" => tabl_2))
          file.puts("]")
      return municipalities #On retourne tous les hashs des villes
    end

    def perform
      municipalities = get_all_the_urls(PAGE_URL)
    end
  end





  def launch

    Scrapper_Loire_Atl.new.perform
    Scrapper_Haute_Corse.new.perform
    Scrapper_Seine_St_Denis.new.perform

end
end