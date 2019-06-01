#!/bin/bash

clear

# Environnement
SCRIPTS=SCRIPTS

# Menu
TITRE="EUFEM"
INVITE="Votre choix :"
OPTION=$(whiptail --title "$TITRE" --menu "$INVITE" 18 60 10 \
"1" "Atelier courant" \
"2" "Edition..." \
"3" "Visionneuse PDF" \
"4" "Publier les PDF" \
"5" "Préférences..." \
"6" "Aide..." \
"7" "Archiver les ateliers récents" \
"8" "Archiver l'atelier courant comme un modèle" \
"9" "Installer les dépendances de EUFEM" \
"10" "Quitter" 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus = 0 ]; then
    #echo "Votre choix : $OPTION"

case $OPTION in
	"1")
	# On récupère le nom de l'atelier courant
	source CONF/atelier.ini
	COURANT=${ATELIER}
	# Choix du nom de l'atelier
	nano CONF/atelier.ini
	# Si cet atelier n'existe pas encore, on le crée, après avoir archivé l'atelier courant...
	source CONF/atelier.ini
	if ! test -d ./ATELIER/${ATELIER}
	then
	./${SCRIPTS}/sauve_atelier_courant.sh ${COURANT}
	./${SCRIPTS}/creation_atelier.sh ${ATELIER}
	fi
	$0
	;;
	"2")
	./${SCRIPTS}/edition.sh
	;;
	"3")
	./${SCRIPTS}/voir.sh
	$0
	;;
	"4")
	./${SCRIPTS}/publier.sh
	$0
	;;
	"5")
	nano CONF/prefs.ini
	$0
	;;
	"6")
	clear
	./${SCRIPTS}/aide.sh
	$0
	;;
	"7")
	./${SCRIPTS}/archiver_ateliers_recents.sh
	$0
	;;
	"8")
	./${SCRIPTS}/sauve_modele.sh
	$0
	;;
	"9")
	./SCRIPTS/install.sh
	$0
	;;
	"10")
	exit
	;;
   esac

else
    echo "vous avez annulé."
fi

