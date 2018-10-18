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

    def get_all_the_urls_of_val_doise_townhalls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("loire-atlantique.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
      count = 0.0
      file = File.open("db/emails.JSON", "w")
      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css
        file.puts(JSON.generate({"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}))
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Loire Atlantique : #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      return municipalities #On retourne tous les hashs des villes
    end
    def perform
      municipalities = get_all_the_urls_of_val_doise_townhalls(PAGE_URL)
    end
  end

  class Scrapper_Bas_Rhin
    PAGE_URL = "http://annuaire-des-mairies.com/bas-rhin.html"
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

    def get_all_the_urls_of_val_doise_townhalls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("bas-rhin.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
      count = 0.0
      file = File.open("db/emails.JSON", "a")
      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css
        file.puts(JSON.generate({"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}))
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Bas Rhin part:1 : #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      return municipalities #On retourne tous les hashs des villes
    end

    def perform
      municipalities = get_all_the_urls_of_val_doise_townhalls(PAGE_URL)
    end
  end

  class Scrapper_Bas_Rhin_2
    PAGE_URL = "http://annuaire-des-mairies.com/bas-rhin-2.html"
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

    def get_all_the_urls_of_val_doise_townhalls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("bas-rhin-2.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
      count = 0.0
      file = File.open("db/emails.JSON", "a")
      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css
        file.puts(JSON.generate({"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}))
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Bas Rhin part:2 : #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      return municipalities #On retourne tous les hashs des villes
    end

    def perform
      municipalities = get_all_the_urls_of_val_doise_townhalls(PAGE_URL)
    end
  end

  class Scrapper_Haut_Rhin
    PAGE_URL = "http://annuaire-des-mairies.com/haut-rhin.html"
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

    def get_all_the_urls_of_val_doise_townhalls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("haut-rhin.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
      count = 0.0
      file = File.open("db/emails.JSON", "a")
      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css
        file.puts(JSON.generate({"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}))
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Haut Rhin part:1 : #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      return municipalities #On retourne tous les hashs des villes
    end

    def perform
      municipalities = get_all_the_urls_of_val_doise_townhalls(PAGE_URL)
    end
  end

  class Scrapper_Haut_Rhin_2
    PAGE_URL = "http://annuaire-des-mairies.com/haut-rhin-2.html"
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

    def get_all_the_urls_of_val_doise_townhalls(page) #Récupére les liens des mairies de Val d'Oise
      url = page.chomp("haut-rhin-2.html") #On garde juste la racine du lien
      page = Nokogiri::HTML(open(page))
      municipalities = [] #Pour stocker tous les hashs des villes
      count = 0.0
      file = File.open("db/emails.JSON", "a")
      page.css("a.lientxt").each do |municipality| #On récupère chaque ville grâce à un sélecteur css
        file.puts(JSON.generate({"name" => municipality.text, "email" => get_the_email_of_a_townhal_from_its_webpage(url + municipality['href'].sub!("./", ""))}))
        #Ci-dessus, on stock le nom de la ville dans "name" et l'email dans "email"
        #On appelle la fonction qui va récupérer une adresse email d'une ville, avec l'url fabriquée grâce à la racine + le lien de la page de la ville
        print "Scrapping Haut Rhin part:2 : #{((count / page.css("a.lientxt").size) * 100).to_i}%   (Municipality : #{municipality.text.red})             \r".yellow
        #On fait un pourcentage de progression grâce à un produit en croix
        count += 1
      end
      return municipalities #On retourne tous les hashs des villes
    end

    def perform
      municipalities = get_all_the_urls_of_val_doise_townhalls(PAGE_URL)
    end
  end

  def launch

    Scrapper_Loire_Atl.new.perform
    Scrapper_Bas_Rhin.new.perform
    Scrapper_Bas_Rhin_2.new.perform
    Scrapper_Haut_Rhin.new.perform
    Scrapper_Haut_Rhin_2.new.perform

end
end