#!/bin/bash

# Synchronise le dossier des images avec celui de la source dans l'atelier courant

source CONF/atelier.ini

if test -d IMG
	then cp -u -v IMG/* ATELIER/${ATELIER}/SOURCE/IMG
	echo "Images propagées. Vous pouvez reprendre ou commencer l'édition."
	sleep 2
else
	echo "ERREUR : le dossier IMG est manquant."
	sleep 3
fi

