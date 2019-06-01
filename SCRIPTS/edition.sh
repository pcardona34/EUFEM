#!/bin/bash

# On récupère les variables

for ini in ./CONF/atelier.ini ./CONF/prefs.ini
do
	if test -s $ini
	then
		source $ini
	else
		./menu.sh && exit
	fi
done

# On teste l'existence du fichier source, sinon on le crée...
FICHIER_SOURCE="ATELIER/${ATELIER}/SOURCE/source_${ATELIER}.md"
if ! test -f ${FICHIER_SOURCE}
then
	echo "Il faut créer... source_${ATELIER}.md";touch ${FICHIER_SOURCE}
fi 

MODS="ATELIER/${ATELIER}/MODS"

# Menu
TITRE="Menu Edition"
INVITE="Votre choix :"
OPTION=$(whiptail --title "$TITRE" --menu "$INVITE" 13 60 6 \
"1" "Propager les images vers la source" \
"2" "Editer la source" \
"3" "Editer les champs des en-têtes" \
"4" "Générer tous les PDF..." \
"5" "Générer des diaporamas à partir des dossiers d'images" \
"6" "Retour au menu principal" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
#    echo "Votre choix : $OPTION"

case $OPTION in
	"1")
	# On synchronise les images
	./SCRIPTS/propager_images.sh
	$0
	;;
	"2")
	# Edition source
	$EDITEUR ${FICHIER_SOURCE}
	$0
	;;
	"3")
	# Edition des champs des en-tetes
	nano ATELIER/${ATELIER}/INI/champs.ini
	$0
	;;
	"4")
	# PDF versions papier et présentation
	
	# Des restrictions dans les sorties PDF ?
	if test -f ATELIER/${ATELIER}/INI/out.ini
	then source ATELIER/${ATELIER}/INI/out.ini
	else PAPIER=true;TROUEE=true;BEAMER=true
	fi
	
	if $PAPIER;then ${MODS}/md2pdf.sh ${ATELIER} --version C;fi
	if $TROUEE;then ${MODS}/md2pdf.sh ${ATELIER} --version T;fi
	if $BEAMER;then ${MODS}/md2beamer.sh ${ATELIER};fi

	# Pause pour le débogage éventuel
	echo "Appuyez sur Entrée pour terminer..."
	read
	# On fait le ménage
	${MODS}/clean.sh
	$0
	;;
	"5")
	# Génération automatique des sources de diaporamas
	for dossier in IMG/*
	do
		if test -d $dossier
		then
			${SCRIPTS}/genere_diaporama.sh $dossier
		else
			 echo "$dossier n'est pas un dossier d'images. Ignoré."
		fi 
	done
	sleep 2
	$0
	;;
	"6")
	./menu.sh
	;;
   esac

else
    echo "vous avez annulé ou quitté."
fi
