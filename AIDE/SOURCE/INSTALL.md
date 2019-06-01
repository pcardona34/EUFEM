# INSTALLATION DE EUFEM

# Comment installer les programmes utiles à EUFEM ?

Compte tenu des scripts et des applications appelées (bash, pandoc, 
LaTeX, etc.) il est recommandé de travailler sur un système GNU/Linux 
comme Ubuntu ou Debian.

+ Le plus simple est d'utiliser l'item de menu :

	`9  Installer les dépendances de EUFEM`    

+ Si vous souhaitez comprendre et maîtriser cette installation des 
dépendances, voici la procédure manuelle :

Au besoin, vérifiez que vous disposez de ces programmes au moyen de la commande `which` exécutée dans un terminal :

	`which pandoc`

Sinon, on installe pandoc ainsi :

	`sudo apt-get install pandoc`

Pour disposer du module de présentation beamer (une extension de LateX), 
ou de certains modèles spécifiques (corpus de poésie, par exemple) il 
sera nécessaire de d'installer certaines extensions du programme LaTeX.

	`sudo apt-get install texlive-latex-recommended`
        `sudo apt-get install texlive-latex-extra`
	`sudo apt-get install texlive-humanities`
	`sudo apt-get install texlive-lang-french`
