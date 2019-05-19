#!/bin/bash

if test -z $1
	then echo "Syntaxe : $0 [NOM_MODELE]";exit 1
fi

MODELE="$1"
if test -d AIDE/DESC_MODELES/${MODELE}
	then head -3 AIDE/DESC_MODELES/${MODELE}/description.txt

	echo -e "\n Afficher la description complète du modèle ? (o)ui|(n)on"
	read REPONSE

	case $REPONSE in
		"o")
		less AIDE/DESC_MODELES/${MODELE}/description.txt
		;;
		"n")
		exit
		;;
		*)
		echo "Réponse inconnue."
	esac	
else
	echo "Aucune description n'est disponible pour le modèle ${MODELE}.";exit 1
fi

exit 0
