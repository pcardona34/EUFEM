# EUFEMD est une chaîne éditoriale

Le principe consiste à écrire un fichier Markdown unique et à générer 
plusieurs fichiers de sortie à la fois (présentation, prise de notes, 
prise de notes trouée...) au format PDF.


# Installation

+ Installez si nécessaire les **dépendances** de 'eufemd' :

		sudo apt-get install dialog
		sudo apt-get install nano
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

## Installation personnalisée

Si vous modifiez *eufemd* avant de l'installer, vous pouvez ensuite procéder ainsi :

		make
		make install
		
# Lancement rapide

+ Pour démarrer la chaîne éditoriale EUFEMD, dans la console ou dans 
un terminal, saisissez la commande :

		eufemd

+ Pour en savoir plus, consultez l'aide intégrée : 

		menu / (A)ide / (G)énéralités... 

# md2pdf : la version CLI allégée de eufemd 

+ À partir de la version 1.0.3, vous disposez d'une version allégée de eufemd en ligne de commande :

		md2pdf

+ Contrairement à 'eufemd', 'md2pdf' ne gère pas les ateliers ni les fichiers sources complexes. Il produit seulement deux formats de sortie :

   + Un format papier (pdf A4 portrait)
   + Une présentation (format beamer : pdf)

+ En revanche, il permet de travailler dans le répertoire courant et d'y convertir un fichier '.md' fourni en argument.

+ Si vous exécutez 'md2pdf' sans argument, une aide succincte sera affichée.

Il existe deux commandes simplifiées de *md2pdf* :

+ **Beamer** : permet de générer une présentation au format LaTeX-Beamer.

		beamer fichier_source.md
		
+ **Papier** : permet de générer un document PDF au format A4-portrait.

		papier fichier_source.md
		
