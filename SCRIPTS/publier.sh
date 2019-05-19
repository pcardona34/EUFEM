#!/bin/bash

# On publie les PDF générés vers la forge actuelle

source CONF/atelier.ini

if ! test -d ${FORGE}
then
	mkdir -p ${FORGE}
fi

if ! test -d ${FORGE}/${IMPRESSION}
then
	mkdir -p ${FORGE}/${IMPRESSION}
fi

DEST="${FORGE}/${NIVEAU}/${COURS}"

if ! test -d ${DEST}
then
	mkdir -p ${DEST}
fi

clear
echo "Destination des PDF : ${DEST}"
echo "Une copie des versions papier sera effectuée dans ${FORGE}/${IMPRESSION}"

cp -u -v ATELIER/${ATELIER}/*.pdf ${DEST}
cp -u -v ATELIER/${ATELIER}/prise_de_notes*.pdf ${FORGE}/${IMPRESSION}

echo -e "\nFin de la publication"
sleep 3
