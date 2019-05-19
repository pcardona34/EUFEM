#!/bin/bash

if test -z $1
then echo -e "Syntaxe : $0 NOM --version OPTION \n Versions : \n T : trouée \n C : complète";exit
fi

source CONF/atelier.ini

IN=ATELIER/${ATELIER}/SOURCE/source_${1}.md
OPTION=${3}
OPT=""
MODS=ATELIER/$ATELIER/MODS


# On (ré)génère l'en-tête PAPIER
if ${MODS}/entete_papier.sh
	then
	ET="ATELIER/${ATELIER}/SOURCE/ENTETE_PAPIER.md"
else
	echo -e "Une erreur est survenue dans la génération de l'en-tête papier...\n";exit 1
fi

# On nettoie les lignes de séparation des diapos
sed -f ${MODS}/SED/texte_sans_separation.sed $IN > ATELIER/${ATELIER}/SOURCE/temp.md

# On applique les règles de la typographie française
sed -f ${MODS}/SED/typo_fr.sed ATELIER/$ATELIER/SOURCE/temp.md > ATELIER/$ATELIER/SOURCE/tempfr.md

case $OPTION in
    "T") OPT="TROUEE";sed -f ${MODS}/SED/texte_troue.sed ATELIER/${ATELIER}/SOURCE/tempfr.md > ATELIER/${ATELIER}/SOURCE/pret.md;;
    "C") OPT="COMPLETE";sed -f ${MODS}/SED/texte_sans_trou.sed ATELIER/${ATELIER}/SOURCE/tempfr.md > ATELIER/${ATELIER}/SOURCE/pret.md;;
esac

if "$IMAGES"
	then echo -e "\nOption : en incorporant les images."
else
	echo -e "\nOption : sans images"
	cat ATELIER/${ATELIER}/SOURCE/pret.md > ATELIER/${ATELIER}/SOURCE/temp.md
	sed -f ${MODS}/SED/texte_sans_image.sed ATELIER/${ATELIER}/SOURCE/temp.md > ATELIER/${ATELIER}/SOURCE/pret.md
fi

OUT=ATELIER/${ATELIER}/prise_de_notes_${1}_${OPT}.pdf

echo -e "\n Génération version papier en cours...\n Version : ${OPT}"
pandoc -s -V papersize:a4 -V geometry:margin=2.5cm $ET ATELIER/${ATELIER}/SOURCE/pret.md -o $OUT
echo "Génération terminée dans le dossier ATELIER/${ATELIER}."

exit 0


