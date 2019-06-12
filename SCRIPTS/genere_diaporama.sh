#!/bin/bash

CHEMIN_DOSSIER="$1"

if test -z "$CHEMIN_DOSSIER"
then
	echo "Syntaxe : $0 [CHEMIN_DOSSIER]"
	exit 1
fi

source CONF/atelier.ini
MOTIF="\_"

CIBLE="ATELIER/${ATELIER}/SOURCE/Diaporama_$(basename $CHEMIN_DOSSIER).md"

echo -e "# Analyse...\n" > $CIBLE
for img in $CHEMIN_DOSSIER/*
do
	echo -e "---\n" >> $CIBLE
	baseimg=$(basename $img)
	imgsansext=${baseimg%.*}
	legende=${imgsansext//$MOTIF/ }
	echo -e "![$legende](IMG/$(basename $CHEMIN_DOSSIER)/$(basename $img))\n" >> $CIBLE
done

whiptail --title "Diaporama automatique" --msgbox "La source du diaporama ${legende} a été écrite dans ATELIER/${ATELIER}/SOURCE." 10 60


