#!/bin/bash

if test -z $1
then echo "Syntaxe : $0 NOM";exit
fi

# On récupère les variables
source CONF/atelier.ini

MODS=ATELIER/$ATELIER/MODS

# On nettoie les trous...
sed -f $MODS/SED/texte_sans_trou.sed ATELIER/$ATELIER/SOURCE/source_${1}.md > ATELIER/$ATELIER/SOURCE/temp.md

# On applique les règles de la typographie française
sed -f $MODS/SED/typo_fr.sed ATELIER/$ATELIER/SOURCE/temp.md > ATELIER/$ATELIER/SOURCE/tempfr.md

# On génère puis on ajoute l'en-tête...
$MODS/entete_presentation.sh

cat ATELIER/$ATELIER/SOURCE/ENTETE_PRESENTATION.md ATELIER/$ATELIER/SOURCE/tempfr.md > ATELIER/$ATELIER/SOURCE/pret.md

echo -e "\n Génération de la présentation au format Beamer / PDF..."
pandoc -s -t beamer --slide-level 2 -V theme:Boadilla -H ATELIER/$ATELIER/TEX/citation.tex ATELIER/$ATELIER/SOURCE/pret.md -o ATELIER/$ATELIER/presentation_${1}.pdf
echo "Fin de la génération dans le dossier ATELIER/${ATELIER}."
