# EUFEM est une chaîne éditoriale

Le principe consiste à écrire un fichier Markdown unique et à générer 
plusieurs fichiers de sortie à la fois (présentation, prise de notes, 
prise de notes trouée...) au format PDF.

Pour en savoir plus, consultez l'aide : 

	menu / Aide / (G)énéralités 

# Lancement rapide

+ Pour démarrer la chaîne éditoriale EUFEM, ouvrez un terminal et 
saisissez la commande :

    ./menu.sh

+ Au besoin, rétablissez les permissions afin de rendre exécutables  les scripts.  
Par exemple :

    chmod +x menu.sh
	
    chmod +x SCRIPTS/*.sh
	
    chmod +x ATELIER/<NOM_ATELIER_COURANT>/MODS/*.sh

# Installation

EUFEM utilise des scripts Bash, ainsi que des programmes tels que 
**pandoc** et **LaTeX**...

+ IMPORTANT : vérifiez la conformité de l'installation de votre système 
en consultant le fichier d'aide à l'installation d'Eufem : 

    menu / Aide / (I)nstallation 
