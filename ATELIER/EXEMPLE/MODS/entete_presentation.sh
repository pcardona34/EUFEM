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
echo "% ${OBJET_COURT}  " >> $CIBLE
echo "% $(date +"%d %b %Y")  " >> $CIBLE

echo -e "## Référence  \n" >> $CIBLE

echo "+ Séquence ${NUM_SEQUENCE}  " >> $CIBLE

echo "+ OBJET D'ÉTUDE : ${OBJET_LONG}  " >> $CIBLE

echo -e "+ ${AUTEUR}, _${TITRE}_, ${DETAIL}  \n" >> $CIBLE

echo "|Référence dans le descriptif|Modalité de lecture|  " >> $CIBLE
echo "|---|---|  " >> $CIBLE
echo "|Réf. ${REF_DESC}, page ${NUM_SEQUENCE}|${ACTIVITE}|  " >> $CIBLE



