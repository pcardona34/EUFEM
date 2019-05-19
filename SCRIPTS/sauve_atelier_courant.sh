#!/bin/bash

COURANT=$1
if ! test -d ATELIER/${COURANT}
then
	echo "ERREUR : l'atelier ${COURANT} a été supprimé."
	sleep 3
	exit
fi

if ! test -d RECENT
	then mkdir RECENT
fi 

# On fait le ménage avant de créer l'archive du modèle
for pdf in ATELIER/${COURANT}/*.pdf
do
	if test -f $pdf
		then rm $pdf
	fi
done

# On crée ou on actualise l'archive dans le dossier des archives récentes
if test -f RECENT/${COURANT}.tar
	then tar uvf RECENT/${COURANT}.tar ATELIER/${COURANT} IMG
	ACTION="mise à jour"
else
	tar cvf RECENT/${COURANT}.tar ATELIER/${COURANT} IMG
	ACTION="créée"
fi

# On fait le ménage dans ATELIER et dans IMG
rm -R ATELIER/${COURANT}
rm -R IMG

whiptail --title "Atelier archivé" --msgbox "L'archive de l'atelier ${COURANT} a été ${ACTION}." 10 60

