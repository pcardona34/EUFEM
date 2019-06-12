#!/bin/bash

# Affichage de l'aide
function menu_aide
{
/bin/bash SCRIPTS/aide.sh
}

# Menu
TITRE="AIDE d'EUFEM"
INVITE="Aide de la chaîne éditoriale EUFEM"
OPTION=$(whiptail --title "$TITRE" --menu "$INVITE" 13 60 4 \
"G" "Généralité et usages courants" \
"U" "Usages avancés" \
"M" "Modèles : description des modèles disponibles" \
"Q" "Quitter l'aide." 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then

case $OPTION in
	"G")
	xdg-open AIDE/LisezMoi.pdf &
	menu_aide
	;;
	"U")
	xdg-open AIDE/Usages_avances.pdf &
	menu_aide
	;;
	"M")
	/bin/bash SCRIPTS/liste_modeles.sh
	;;
	"Q")
	/bin/bash ./eufem.sh
	;;
esac
else
  echo "Vous avez annulé..."
fi
