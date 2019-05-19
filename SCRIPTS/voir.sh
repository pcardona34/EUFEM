#!/bin/bash

# Variables...
source CONF/atelier.ini

FIC=ATELIER/${ATELIER}/presentation_${ATELIER}.pdf

if test -f $FIC;then ${VISIONPDF} $FIC
else
	echo "Il faut créer ${FIC}";
fi

PN=ATELIER/${ATELIER}/prise_de_notes_${ATELIER}_COMPLETE.pdf
PNT=ATELIER/${ATELIER}/prise_de_notes_${ATELIER}_TROUEE.pdf

for pn in ${PN} ${PNT}
do 
	if test -f $pn;then ${VISIONPDF} $pn
	# 2>/dev/null
		else
			echo "Il faut créer ${pn}";
	fi
done




