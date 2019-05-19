#!/bin/bash

# On récupère les variables
source CONF/atelier.ini

for ini in ATELIER/${ATELIER}/INI/champs.ini
do
	if test -s $ini
	then
		source $ini
	else
		./menu.sh && exit 1
	fi
done

# Nom du fichier d'en-tête de la présentation
CIBLE=ATELIER/${ATELIER}/SOURCE/ENTETE_PAPIER.md

# On écrit l'en-tête du header Fancy de LaTeX

echo "---" > $CIBLE
echo "header-includes: |" >> $CIBLE
echo "    \usepackage{lastpage}" >> $CIBLE
echo "    \usepackage{fancyhdr}" >> $CIBLE
echo "    \pagestyle{fancy}" >> $CIBLE
echo "    \lhead{\textbf{Prise de notes}}" >> $CIBLE
echo "    \chead{}" >> $CIBLE
echo "    \rhead{\textbf{${AUTEUR}, \textit{${TITRE}}, ${DETAIL}}}" >> $CIBLE
echo "    \lfoot{Séquence ${NUM_SEQUENCE} — ${OBJET_COURT}}" >> $CIBLE
echo "    \cfoot{}" >> $CIBLE
echo "    \rfoot{\thepage~/~\pageref{LastPage}}" >> $CIBLE
echo "---" >> $CIBLE

# On écrit le titre sur le haut de la première page

echo "# Séquence ${NUM_SEQUENCE}, ${OBJET_COURT}.  " >> $CIBLE
echo -e "## ${ACTIVITE} (${REF_DESC}) : ${AUTEUR}, _${TITRE}_, ${DETAIL}  \n" >> $CIBLE

exit 0

