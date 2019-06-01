#!/bin/bash

# On récupère les variables
source CONF/atelier.ini

# On déplace les archives TAR des ateliers récents vers la forge
if test -z "${FORGE}"
then
	whiptail --title "Erreur" --msgbox "La variable FORGE n'est pas configurée." 10 60
	exit 1
fi

if test -d "$FORGE"
then 
	nombre=$(ls -A1 RECENT/*.tar|wc -l)
	if [[ $nombre -eq 0 ]]
	then whiptail --title "Information" --msgbox "Aucune archive dans le dossier RECENT" 10 60;exit 1
	else
	for arc in RECENT/*.tar
	do mv $arc $FORGE/
	done
	whiptail --msgbox "Les ateliers ont été archivés dans $(basename $FORGE)" 10 60
	fi
else
	whiptail --title "Erreur" --msgbox "Vérifiez le chemin de la forge :\n${FORGE}"

fi
