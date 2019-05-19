# INSTALLATION DE EUFEM

# Comment installer les programmes utiles à EUFEM ?

Compte tenu des scripts et des applications appelées (bash, pandoc, LaTeX, etc.) il est recommandé de travailler sur un système GNU/Linux comme Ubuntu ou Debian.

Au besoin, vérifiez que vous disposez de ces programmes au moyen de la commande `which` exécutée dans un terminal :

	`which pandoc`

Sinon, on installe pandoc ainsi :

	`sudo apt-get install pandoc`

Pour disposer du module de présentation beamer (une extension de LateX), il sera nécessaire de l'installer ainsi, par exemple sur Ubuntu / Debian, ainsi que les fontes de texlive-latex-extra :

	`sudo apt-get install latex-beamer`
	`sudo apt-get install texlive-latex-extra`

