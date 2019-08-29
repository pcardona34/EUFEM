# EUFEMD est une chaîne éditoriale

Le principe consiste à écrire un fichier Markdown unique et à générer 
plusieurs fichiers de sortie à la fois (présentation, prise de notes, 
prise de notes trouée...) au format PDF.


# Installation

+ Installez si nécessaire les **dépendances** de 'eufemd' :

		sudo apt-get install pandoc
		sudo apt-get install texlive-latex-recommended 
		sudo apt-get install texlive-latex-extra
		sudo apt-get install texlive-humanities
		sudo apt-get install texlive-lang-french

+ Si vous souhaitez visualiser les documents pdf générés en mode graphique :

		sudo apt-get install qpdfview

+ Sinon, installez Midnight Commander qui fournit la visionneuse dans la 
console mcview 		

		sudo apt-get install mc 

+ Téléchargez le paquet `eufemd.deb` depuis l'onglet 'release', puis exécutez la commande :

		sudo dpkg -i eufemd.deb


# Lancement rapide

+ Pour démarrer la chaîne éditoriale EUFEMD, dans la console ou dans 
un terminal, saisissez la commande :

		eufemd

+ Pour en savoir plus, consultez l'aide intégrée : 

		menu / (A)ide / (G)énéralités... 
