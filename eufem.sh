#!/bin/bash

clear

### Fonctions ###

### verifier_dependances ###
### Vérifie que les dépendances de EUFEM soient présentes
### Sinon affiche l'aide...
function verifier_dependances
{
# On recherche si le test a déjà été exécuté avec succès
if test -f CONF/install.ini
then 
	source CONF/install.ini
	if [ $INSTALL = true ]
	then return 0
	fi
fi

DRAPEAU=true

source CONF/dep.ini

### On vérifie pandoc
for dep in \
$pandoc 
do
	echo -e "recherche de :\n${dep}"
	if ! test -f $dep
	then
		DRAPEAU=false
		/bin/bash SCRIPTS/aide_install.sh
		return 1
		break
	fi
done

### On vérifie les dossiers dans TeXLive
for dep in \
$beamer \
$verse \
$lineno
do
	echo -e "recherche de :\n${dep}"
	if ! test -d $dep
	then
		DRAPEAU=false
		/bin/bash SCRIPTS/aide_install.sh
		return 1
		break
	fi
done

if [ $DRAPEAU = true ]
	then whiptail --title "Vérification des dépendances" \
--msgbox "Toutes les dépendances nécessaires sont installées." 8 60
	echo "INSTALL=true" > CONF/install.ini
	return 0
fi

}

### parametre_est_correct
### Vérifie qu'un paramètre ne soit pas vide
function parametre_est_correct
{
# Paramètres de la fonction :
#  $1 : nom de la variable à vérifier
#  $2 : valeur à vérifier

if test -z "$2"
    then whiptail --title "Erreur" --msgbox "La variable $1 ne doit pas être vide." 10 60
    return 1
else
    return 0
fi
}

### proprietes_atelier
### vérifie l'intégrité des paramètres dans CONF/atelier.ini
### Et oblige, le cas échéant, à corriger le paramètres défectueux
function proprietes_atelier
{
	# Choix du nom de l'atelier
	nano CONF/atelier.ini
	source CONF/atelier.ini
	# On vérifie la saisie du nom de cet atelier
	if (parametre_est_correct "ATELIER" "$ATELIER" \
		&& parametre_est_correct "FORGE" "$FORGE" \
		&& parametre_est_correct "NIVEAU" "$NIVEAU" \
		&& parametre_est_correct "COURS" "$COURS" \
		&& parametre_est_correct "IMPRESSION" "$IMPRESSION" \
		&& parametre_est_correct "IMAGES" "$IMAGES")
	then 
	  whiptail --title "Information" --msgbox "Les propriétés ont été enregistrées." 10 60
	  return 0 
	else
	  # appel récursif
	  proprietes_atelier
	fi
}

################

if ! verifier_dependances
then
	exit 1
fi

# Menu
TITRE="EUFEM"
INVITE="Votre choix :"
OPTION=$(whiptail --title "$TITRE" --menu "$INVITE" 17 60 9 \
"1" "Propriétés de l'atelier courant" \
"2" "Editer cet atelier" \
"3" "Visionneuse PDF" \
"4" "Publier les PDF" \
"5" "Préférences..." \
"6" "Aide..." \
"7" "Archiver les ateliers récents" \
"8" "Archiver l'atelier courant comme un modèle" \
"9" "Quitter" 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus = 0 ]; then
    #echo "Votre choix : $OPTION"

case $OPTION in
	"1")
	# On récupère le nom de l'atelier courant
	source CONF/atelier.ini
        COURANT="$ATELIER"

	# On  édite et on vérifie l'intégrité des propriétés de l'atelier
        proprietes_atelier

	# Si cet atelier n'existe pas encore, on le crée, après avoir archivé 
	# l'atelier courant...
	if ! test -d "ATELIER/$ATELIER"
		then 
			/bin/bash SCRIPTS/sauve_atelier_courant.sh "$COURANT"
			/bin/bash SCRIPTS/creation_atelier.sh "$ATELIER"
	fi
	$0
	;;
	"2")
	/bin/bash SCRIPTS/edition.sh
	;;
	"3")
	/bin/bash SCRIPTS/voir.sh
	$0
	;;
	"4")
	/bin/bash SCRIPTS/publier.sh
	$0
	;;
	"5")
	nano CONF/prefs.ini
	$0
	;;
	"6")
	clear
	/bin/bash SCRIPTS/aide.sh
	$0
	;;
	"7")
	/bin/bash SCRIPTS/archiver_ateliers_recents.sh
	$0
	;;
	"8")
	/bin/bash SCRIPTS/sauve_modele.sh
	$0
	;;
	"9")
	exit 0
	;;
   esac

else
    echo "vous avez annulé."
fi

