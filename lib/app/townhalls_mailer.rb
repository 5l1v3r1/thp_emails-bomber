
class Mailer

gmail = Gmail.connect("kouklikarto@gmail.com", "thplesvoleurs")


Gmail.connect("kouklikarto@gmail.com", "thplesvoleurs") do |gmail|
 puts gmail.logged_in?
end


my_hash = JSON.parse(File.read('db/emails.JSON'))


my_hash.each do |k,v|


gmail.deliver do
  to v
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
sleep (4)
end

gmail.logout

