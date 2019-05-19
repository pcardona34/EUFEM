#!/bin/bash

# On récupère les variables

for ini in CONF/atelier.ini CONF/editeur.ini
do
	if test -s $ini
	then
		source $ini
	else
		./menu.sh && exit
	fi
done

# On définit l'éditeur préféré
for edi in $EDITEURS
do
	if ! test -f $edi
		then echo "$edi n'est pas disponible sur votre système."
		continue
	else
		EDITEUR=$edi
		break
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
OPTION=$(whiptail --title "$TITRE" --menu "$INVITE" 12 60 5 \
"1" "Propager les images vers la source" \
"2" "Editer la source" \
"3" "Editer les champs des en-têtes" \
"4" "Générer tous les PDF..." \
"5" "Retour au menu prinicipal" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
#    echo "Votre choix : $OPTION"

case $OPTION in
	"1")
	# On synchronise les images
	SCRIPTS/propager_images.sh
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
	${MODS}/md2pdf.sh ${ATELIER} --version C
	${MODS}/md2pdf.sh ${ATELIER} --version T
	${MODS}/md2beamer.sh ${ATELIER}
	# On fait le ménage
	${MODS}/clean.sh
	$0
	;;
	"5")
	./menu.sh
	;;
   esac

else
    echo "vous avez annulé ou quitté."
fi


