#!/bin/bash

# Affichage de l'aide

echo "Aide de la chaîne éditoriale EUFEM"

echo -e "\n(G)énéralité et usages courants"
echo "(U)sages avancés"
echo "(I)nstallation des programmes nécessaires"
echo "(M)odèles : description des modèles disponibles"
echo "(Q)uitter l'aide."

echo -e "\n Votre choix ? (Validez avec la touche <Entrée>)"
read REP

case $REP in
	"g")
	xdg-open AIDE/LisezMoi.pdf &
	$0
	;;
	"G")
	xdg-open AIDE/LisezMoi.pdf &
	$0
	;;
	"u")
	xdg-open AIDE/Usages_avances.pdf &
	$0
	;;
	"U")
	xdg-open AIDE/Usages_avances.pdf &
	$0
	;;
	"i")
	xdg-open AIDE/Installation_Eufem.pdf &
	$0
	;;
	"I")
	xdg-open AIDE/Installation_Eufem.pdf &
	$0
	;;
	"m")
	SCRIPTS/liste_modeles.sh
	;;
	"M")
	SCRIPTS/liste_modeles.sh
	;;
	"q")
	./menu.sh
	;;
	"Q")
	./menu.sh
	;;
esac
