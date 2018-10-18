require "gmail"
require "dotenv"
require "awesome_print"
require "json"

class Mailer
  Dotenv.load
  GMAIL = Gmail.connect(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASS"])

  def login
    print "Connexion...\r".yellow
    if GMAIL.logged_in?
      puts "Connexion réussie !                                                  \n".green
    else
      puts "La connexion a échouée !\n".red
      exit
    end
  end

  def extract
    file = File.read("db/emails.JSON")
    return JSON.parse(file)
  end

  def send_emails(municipalities, name)
    timer = 1
    for departement in municipalities
      for municipality in departement.values
        for values in municipality
          print "Envoi de l'email en cours...\r".yellow
          GMAIL.deliver do
            to values["email"]
            subject "THE HACKING PROJECT"
            text_part do
              body
            end
            html_part do
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
          puts "L'email a été envoyé à l'adresse email de la mairie de #{values["name"].capitalize}: #{values["email"].red}".green
          if timer > 1
            print "Attente de #{timer} secondes...\r".yellow
          else
            print "Attente de #{timer} seconde...\r".yellow
          end
          sleep(timer)
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
