#!/bin/bash

# Synchronise le dossier des images avec celui de la source dans l'atelier courant

source CONF/atelier.ini

if test -d IMG
	then cp -u -v --recursive IMG/* ATELIER/${ATELIER}/SOURCE/IMG
	whiptail --title "Propagation des images" \
--msgbox "Images propagées. Vous pouvez reprendre ou commencer l'édition." 8 60
else
	whiptail --title "ERREUR" --msgbox "Le dossier IMG est manquant." 8 60
fi
