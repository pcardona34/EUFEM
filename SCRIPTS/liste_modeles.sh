#!/bin/bash

# On liste les modèles disponibles
# Et on affiche l'aide associée

for m in MODELES/*.tar
do
	desc=$(basename $m)
	clear	
	echo "Modèle : ${desc%.*}"	
	SCRIPTS/info_modele.sh ${desc%.*}
done 
