#!/bin/bash

PWD=$(pwd)

if [ "${PWD#$HOME/}" != "EUFEM" ]
then
	echo "Veuillez exécuter le script d'installation"
	echo "à partir du dossier EUFEM ainsi :"
	echo -e "\nsudo /bin/bash SCRIPTS/install.sh"

	exit 1
fi

# On récupère la liste des dépendances : $DEP

source CONF/dep.ini

if ! test -f $pandoc
	then 
			echo "Pandoc : à installer..."
			sudo apt-get install $pandoc
else
		echo "Pandoc est déjà installé."
fi

if ! test -d $beamer || ! test -d $verse || ! test -d $french
	then
			echo "Des dépendances de LaTeX sont manquantes..."
			echo "On tente de les installer..."
			sudo apt-get install texlive-latex-recommended
			sudo apt-get install texlive-latex-extra
			sudo apt-get install texlive-humanities
			sudo apt-get install texlive-lang-french
			echo -e "\nAppuyez sur Entrée pour terminer..."
			read
else
			echo "LaTeX et ses dépendances sont déjà installés."
fi

sleep 2
