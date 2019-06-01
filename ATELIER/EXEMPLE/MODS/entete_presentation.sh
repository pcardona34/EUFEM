#!/bin/bash

# On récupère les variables
source CONF/atelier.ini

for ini in ATELIER/${ATELIER}/INI/champs.ini
do
	if test -s $ini
	then
		source $ini
	else
		./menu.sh && exit
	fi
done

# Nom du fichier d'en-tête de la présentation
CIBLE=ATELIER/${ATELIER}/SOURCE/ENTETE_PRESENTATION.md


# On écrit l'en-tête
echo "% ${TITRE}  " > $CIBLE
echo "% ${ACTIVITE}  " >> $CIBLE
echo "% $(date +"%d %b %Y")  " >> $CIBLE

