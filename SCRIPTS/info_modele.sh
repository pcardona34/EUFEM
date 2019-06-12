#!/bin/bash

if test -z "$1"
	then echo "Syntaxe : $0 [NOM_MODELE]";exit 1
fi

MODELE="$1"
if test -d AIDE/DESC_MODELES/${MODELE}
	then whiptail --title "Modèle : $1" --scrolltext --textbox AIDE/DESC_MODELES/${MODELE}/description.txt 20 80
else
	whiptail --title "ERREUR" --msgbox  "Aucune description n'est disponible pour le modèle ${MODELE}." 8 60;exit 1
fi

exit 0
