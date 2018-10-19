require "gmail"
require "dotenv"
require "awesome_print"
require "json"

class Mailer
  Dotenv.load
  GMAIL = Gmail.connect(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASS"]) #On initialise la connexion client

  def login #Vérifie si la connexion a réussie
    print "\nConnexion...\r".yellow
    if GMAIL.logged_in?
      puts "\nConnexion réussie !                                                  \n".green
    else
      puts "\nLa connexion a échouée !".red
      exit
    end
  end

  def extract #Extrait l'array du fichier JSON
    file = File.read("db/emails.JSON")
    return JSON.parse(file)
  end

  def send_emails(municipalities, name)
    timer = 1 #Le nombre de secondes entre chaque envoi d'email
    for departement in municipalities
      puts "\n\n------------- | Département : #{departement.keys[0]} | -------------".blue
      for municipality in departement.values
        for values in municipality
          unless values["email"] == "AUCUN EMAIL" #A moins qu'il n'y ait pas d'email pour cette mairie
            print "Envoi de l'email en cours...\r".yellow
            GMAIL.deliver do
              to values["email"] #On sélectionne le destinataire
              subject "THE HACKING PROJECT" #On définit le sujet du mail
              text_part do
                body #Le corps du message
              end
              html_part do #On envoit en format HTML
                content_type 'text/html; charset=UTF-8'
                body "<p>Bonjour,<br>
                    Je m'appelle #{name}, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.<br>
                    <br>
                    Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{values["name"].capitalize} veut changer le monde avec nous ?<br>
                    <br>
                    <br>
                    Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80<br>
                </p>"
              end
            end
            puts "L'email a été envoyé à l'adresse email de la mairie de #{values["name"]} : #{values["email"].red}".green
            if timer > 1 #On gère le pluriel pour l'affichage des secondes
              print "Attente de #{timer} secondes...\r".yellow
            else
              print "Attente de #{timer} seconde...\r".yellow
            end
            sleep(timer) #Le timer fait son effet
          else #S'il n'y a aucun email pour la mairie
            puts "Aucun email n'est disponible pour la mairie de #{values["name"]}.".red
          end
        end
      end
    end
    puts "\nTous les emails ont bien été envoyés !".green
  end

  def perform
    login
    send_emails(extract, "Jean Lassalle")
  end
end
