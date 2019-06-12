#!/bin/bash

# Variables...
source CONF/atelier.ini
source CONF/prefs.ini

PDFS=ATELIER/${ATELIER}

# On vérifie l'existence de fichiers PDF
ls ${PDFS}/*.pdf
if ! [ "$?" = "0" ]
then whiptail --title "Erreur" --msgbox "Aucun fichier PDF !" 10 60
exit 1
fi

# On vérifie la visionneuse PDF
if test -n "$VISIONPDF" && test -f "$VISIONPDF"
then
	for pdf in ${PDFS}/*.pdf
	do
	${VISIONPDF} --unique $pdf 2>/dev/null
	done
else
	whiptail --title "Erreur" --msgbox "Aucune visionneuse PDF. Vérifiez vos préférences." 10 60; exit 1
fi
