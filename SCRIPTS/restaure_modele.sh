#!/bin/bash

# Restauration du modèle choisi
# Archive *.tar passée en paramètre : $1

ARCHIVE="$1"

echo "Restauration du modèle : ${ARCHIVE%.*}..."
sleep 2
tar xf MODELES/$ARCHIVE

# Le nom du nouveau cours se trouve dans atelier.ini
source CONF/atelier.ini
mv ATELIER/${ARCHIVE%.*} ATELIER/${ATELIER}
mv ATELIER/${ATELIER}/SOURCE/source_${ARCHIVE%.*}.md ATELIER/${ATELIER}/SOURCE/source_${ATELIER}.md 

whiptail --title "Nouvel atelier" --msgbox "Le nouvel atelier ${ATELIER} peut être édité." 8 60
