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
echo "    \rhead{\textbf{${ACTIVITE} -- \textit{${TITRE}}}}" >> $CIBLE
echo "    \lfoot{}" >> $CIBLE
echo "    \cfoot{\thepage~/~\pageref{LastPage}}" >> $CIBLE
echo "    \rfoot{}" >> $CIBLE
echo "---" >> $CIBLE

# On écrit le titre sur le haut de la première page

echo -e "\n# ${ACTIVITE} : _${TITRE}_ \n" >> $CIBLE

exit 0

