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
	# On préserve l'archive EXEMPLE.tar
	if test -f RECENT/EXEMPLE.tar
	then mv RECENT/EXEMPLE.tar RECENT/EXEMPLE.sauve
	fi
	# On compte les archives tar dans RECENT :
	nombre=$(ls -A1 RECENT/*.tar|wc -l)
	if [[ $nombre -eq 0 ]]
	then whiptail --title "Information" \
	--msgbox "Aucune nouvelle archive dans le dossier RECENT" 10 60;exit 1
	else
	for arc in RECENT/*.tar
	do mv $arc $FORGE/
	done
	whiptail --msgbox "Tous les ateliers récents (sauf EXEMPLE) ont été archivés dans $(basename $FORGE)" 10 60
	fi
	# On remet EXEMPLE dans son état initial
	if test -f RECENT/EXEMPLE.sauve
	then mv RECENT/EXEMPLE.sauve RECENT/EXEMPLE.tar
	fi
else
	whiptail --title "Erreur" --msgbox "Vérifiez le chemin de la forge :\n${FORGE}"
fi
