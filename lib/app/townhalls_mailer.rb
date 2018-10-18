require "gmail"
require "dotenv"
require "awesome_print"
require "json"

class Mailer
  GMAIL = Gmail.connect("kouklikarto@gmail.com", "thplesvoleurs")
  
  def login
    print "Connexion...\r".yellow
    if GMAIL.logged_in?
      puts "Connexion réussie !\n".green
    else
      puts "La connexion a échouée !\n".red
      exit
    end
  end

  def extract
    file = File.read("db/emails.JSON")
    return JSON.parse(file)
  end

  def send_emails(municipalities)
    timer = 4 #Laisser au dessus de 4 pour éviter un ban
    count = 0
    for municipality in municipalities
      print "Envoi de l'email en cours...\r".yellow
      GMAIL.deliver do
        to municipality["email"]
        subject " THE TARTE PROJECT "
        text_part do
          body
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body "<p>Bonjour,<br></p>
          <p>Voici une recette de tarte tatin<br></p>
          <p>
              Etape 1<br>
              Préparer le caramel :<br>
              Déposer le beurre en dés dans une casserole, puis verser par dessus le sucre. Laisser cuire à feu doux pendant 5 min sans mélanger, le caramel se fait tout seul.<br>
              Etape 2<br>
              Déposer la caramel sur le fond d'un plat à tarte.<br>
              Etape 3<br>
              Ajouter les pommes coupés en gros dés, puis recouvrir de la pâte brisée.<br>
              Etape 4<br>
              Enfourner pendant 25 min au four à 210°C (thermostat 7).<br>
              Etape 5<br>
              Servir tiède avec une boule de glace vanille.<br>
          </p>"
        end
      end
      puts "L'email a été envoyé à : #{municipality["email"].red}".green
      count += 1
      if count == municipalities.length
        puts "\nTous les emails ont bien été envoyés !".green
        exit
      end
      if timer > 1
        print "Attente de #{timer} secondes...\r".yellow
      else
        print "Attente de #{timer} seconde...\r".yellow
      end
      sleep(timer)
    end
  end

  def perform
    login
    send_emails(extract)
  end
end
