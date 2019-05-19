#!/bin/bash

ATELIER="$1"

# Existe-t-il une archive de cet atelier dans le dossier RECENT ?
if test -f RECENT/$ATELIER.tar
	then
		echo "Cet atelier, ${ATELIER},  existe déjà et sera restauré..."
		sleep 3
		tar xvf RECENT/$ATELIER.tar
		echo "Fin de la restauration."
		sleep 3
else
	echo "Création du nouvel atelier ${ATELIER}..."
	sleep 3
	./SCRIPTS/choisit_modele.sh
fi

