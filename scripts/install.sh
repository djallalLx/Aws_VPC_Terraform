#!/bin/bash
apt-get update -y
apt-get install apache2 -y
sudo snap install aws-cli --classic


# Charger les variables d'environnement AWS depuis un fichier séparé
aws configure
source ./aws_env.sh


# Configuration non interactive d'AWS CLI
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set default.region "$AWS_DEFAULT_REGION"


# Création du dossier pour ton audio
mkdir -p /var/www/html/audio

# Téléchargement automatique du fichier audio depuis S3
aws s3 cp s3://djallalsarah/sourate.mp3 /var/www/html/audio/sourate.mp3

# Création de la page HTML avec animation solaire et audio intégré
cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Animation Solaire avec Audio MP3</title>
  <style>
    body {
      margin: 0;
      height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
      background-color: black;
      color: white;
      font-family: Arial, sans-serif;
      overflow: hidden;
      padding-top: 20px;
      position: relative;
    }
    .header-text {
      text-align: center;
      margin-bottom: 20px;
      font-size: 1.5em;
      font-weight: bold;
    }
    .container {
      font-size: 10px;
      width: 40em;
      height: 40em;
      position: relative;
    }
    .sun {
      position: absolute;
      top: 15em;
      left: 15em;
      width: 10em;
      height: 10em;
      background-color: yellow;
      border-radius: 50%;
      box-shadow: 0 0 3em white;
    }
    .earth, .moon {
      position: absolute;
      border-style: solid;
      border-color: white transparent transparent transparent;
      border-width: 0.1em 0.1em 0 0;
      border-radius: 50%;
    }
    .earth {
      top: 5em;
      left: 5em;
      width: 30em;
      height: 30em;
      animation: orbit 36.5s linear infinite;
    }
    .moon {
      top: 0;
      right: 0;
      width: 8em;
      height: 8em;
      animation: orbit 2.7s linear infinite;
    }
    .earth::before,
    .moon::before {
      content: '';
      position: absolute;
      border-radius: 50%;
    }
    .earth::before {
      top: 2.8em;
      right: 2.8em;
      width: 3em;
      height: 3em;
      background-color: aqua;
    }
    .moon::before {
      top: 0.8em;
      right: 0.2em;
      width: 1.2em;
      height: 1.2em;
      background-color: silver;
    }
    @keyframes orbit {
      to { transform: rotate(360deg); }
    }
  </style>
</head>
<body>
  <div class="header-text">
    « Et c'est Lui qui est le Seigneur de Sirius » (sourate An-Najm, verset 49)
  </div>
  <div class="container">
    <div class="sun"></div>
    <div class="earth">
      <div class="moon"></div>
    </div>
  </div>

  <!-- Intégration audio (sans autoplay, on démarre la lecture au clic sur la page) -->
  <audio id="myAudio" loop controls>
    <source src="audio/sourate.mp3" type="audio/mpeg">
    Votre navigateur ne supporte pas l'audio HTML5.
  </audio>

  <script>
    window.addEventListener('load', function() {
      var audio = document.getElementById('myAudio');
      // Lancer la lecture audio au premier clic sur la page
      function playAudio() {
         audio.play();
         // Supprime l'écouteur après le premier clic pour éviter les appels multiples
         document.removeEventListener('click', playAudio);
      }
      document.addEventListener('click', playAudio);
    });
  </script>
</body>
</html>
EOF

# Correction des permissions pour le dossier audio
chmod -R 755 /var/www/html/audio

# Redémarrage d'Apache (si systemctl ne trouve pas apache2, essayez 'sudo service apache2 restart')
sudo service apache2 restart
