#!/bin/bash

# On publie les PDF générés vers la forge actuelle

source CONF/atelier.ini

if ! test -d "${FORGE}"
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

cp -u -v ATELIER/${ATELIER}/*.pdf ${DEST}
cp -u -v ATELIER/${ATELIER}/prise_de_notes*.pdf ${FORGE}/${IMPRESSION}

whiptail --title "Publication" --msgbox "Les PDF ont été copiés dans ${DEST} ainsi qu'une copie des versions papier dans ${FORGE}/${IMPRESSION}" 12 60

