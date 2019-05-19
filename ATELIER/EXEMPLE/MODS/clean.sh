#!/bin/bash
# Nettoyage
# -------------------------------------------------

source CONF/atelier.ini

echo -e "\n Ménage de printemps..."

for f in ATELIER/${ATELIER}/SOURCE/tem*.md ATELIER/${ATELIER}/SOURCE/pret.md ATELIER/${ATELIER}/SOURCE/ENTETE_*.md 

do
	if test -f $f ;then rm --verbose $f;fi
done

