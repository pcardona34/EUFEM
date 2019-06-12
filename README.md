# EUFEM est une chaîne éditoriale

Le principe consiste à écrire un fichier Markdown unique et à générer 
plusieurs fichiers de sortie à la fois (présentation, prise de notes, 
prise de notes trouée...) au format PDF.

Pour en savoir plus, consultez l'aide : 

	menu / Aide / (G)énéralités 

# Lancement rapide

+ Pour démarrer la chaîne éditoriale EUFEM, ouvrez un terminal et 
saisissez la commande :

		/bin/bash ./eufem.sh

+ Ou bien, après avoir rendu ce script exécutable :

		chmod +x eufem.sh
	
		./eufem.sh	

# Installation

EUFEM utilise des scripts Bash, ainsi que des programmes tels que 
**pandoc** et **LaTeX**...

+ Pour installer toutes les dépendances :

		sudo /bin/bash SCRIPTS/install.sh
