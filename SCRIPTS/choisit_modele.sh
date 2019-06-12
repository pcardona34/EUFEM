#!/bin/bash

# D'après "filebrowse.sh written by Claude Pageau"

startdir="MODELES"
filext='tar'
menutitle="Sélection des modèles"

#------------------------------------------------------------------------------
function Filebrowser()
{
# first parameter is Menu Title
# second parameter is optional dir path to starting folder
# otherwise current folder is selected

    if [ -z $2 ] ; then
        dir_list=$(ls -lhp  | awk -F ' ' ' { print $9 " " $5 } ')
    else
        cd "$2"
        dir_list=$(ls -lhp  | awk -F ' ' ' { print $9 " " $5 } ')
    fi

    curdir=$(pwd)
    if [ "$curdir" == "/" ] ; then  # Check if you are at root folder
        selection=$(whiptail --title "$1" \
                              --menu "Sélectionnez le Fichier dans le dossier:\n$curdir" 0 0 0 \
                              --cancel-button Annuler \
                              --ok-button Sélectionner $dir_list 3>&1 1>&2 2>&3)
    else   # Not Root Dir so show ../ BACK Selection in Menu
        selection=$(whiptail --title "$1" \
                              --menu "Sélectionnez le Fichier dans le dossier\n$curdir" 0 0 0 \
                              --cancel-button Annuler \
                              --ok-button Sélectionner ../ RETOUR $dir_list 3>&1 1>&2 2>&3)
    fi

    RET=$?
    if [ $RET -eq 1 ]; then  # Check if User Selected Cancel
       return 1
    elif [ $RET -eq 0 ]; then
       if [[ -d "$selection" ]]; then  # Check if Directory Selected
          Filebrowser "$1" "$selection"
       elif [[ -f "$selection" ]]; then  # Check if File Selected
          if [[ $selection == *$filext ]]; then   # Check if selected File has .ext extension
            if (whiptail --title "Confirmation de la Selection" --yesno "Chemin : $curdir\nFichier: $selection" 0 0 \
                         --yes-button Confirmer \
                         --no-button Recommencer); then
                filename="$selection"
                filepath="$curdir"    # Return full filepath  and filename as selection variables
            else
                Filebrowser "$1" "$curdir"
            fi
          else   # Not *.ext so Inform User and restart
             whiptail --title "ERREUR: extension TAR attendue" \
                      --msgbox "$selection\nVous devez sélectionner une archive TAR" 0 0
             Filebrowser "$1" "$curdir"
          fi
       else
          # Could not detect a file or folder so Try Again
          whiptail --title "ERREUR: Sélection erronée" \
                   --msgbox "Erreur lors du changement de chemin $selection" 0 0
          Filebrowser "$1" "$curdir"
       fi
    fi
}


Filebrowser "$menutitle" "$startdir"

exitstatus=$?
if [ $exitstatus -eq 0 ]; then
    if [ "$selection" == "" ]; then
        echo "L'utilisateur a pressé la touche Esc sans sélection de fichier"
    else
        #whiptail --title "Un fichier a été sélectionné" --msgbox " \
        #Information sur le fichier sélectionné
        #Nom : $filename
        #Dossier : $filepath
        #\
        #" 0 0 0
		
	cd ..
	/bin/bash SCRIPTS/restaure_modele.sh $filename

    fi
else
    echo "L'utilisateur a annulé la sélection du modèle."
fi


