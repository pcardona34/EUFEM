#!/bin/bash

source ./CONF/atelier.ini

echo "Un modèle sera créé à partir de l'atelier actuel : $ATELIER..."
echo "Matière ou domaine ?"
read DOMAINE
echo "Activité (cours, méthode, évaluation) ?"
read ACTIVITE

cp --recursive ATELIER/$ATELIER ATELIER/${ACTIVITE}_${DOMAINE}
mv ATELIER/${ACTIVITE}_${DOMAINE}/SOURCE/source_${ATELIER}.md ATELIER/${ACTIVITE}_${DOMAINE}/SOURCE/source_${ACTIVITE}_${DOMAINE}.md

echo "Voulez-vous personnaliser le fichier source de ce modèle ?"
echo "(o)ui : recommandé | (n)on"
read EDIT
if [ "$EDIT" = "o" ]
then nano ATELIER/${ACTIVITE}_${DOMAINE}/SOURCE/source_${ACTIVITE}_${DOMAINE}.md
fi

# On fait le ménage avant de créer l'archive du modèle
rm ATELIER/${ACTIVITE}_${DOMAINE}/*.pdf

# On crée ou on actualise l'archive dans le dossier des modèles
if test -f MODELES/${ACTIVITE}_${DOMAINE}.tar
	then tar uvf MODELES/${ACTIVITE}_${DOMAINE}.tar ATELIER/${ACTIVITE}_${DOMAINE} IMG
	ACTION="mis à jour"
else
	tar cvf MODELES/${ACTIVITE}_${DOMAINE}.tar ATELIER/${ACTIVITE}_${DOMAINE} IMG
	ACTION="créé"
fi

# On crée ou on met à jour la description :
if ! test -d AIDE/DESC_MODELES/${ACTIVITE}_${DOMAINE}
	then mkdir AIDE/DESC_MODELES/${ACTIVITE}_${DOMAINE}
fi
cp -u ATELIER/${ACTIVITE}_${DOMAINE}/description.txt AIDE/DESC_MODELES/${ACTIVITE}_${DOMAINE}

# On fait le ménage dans ATELIER
rm -R ATELIER/${ACTIVITE}_${DOMAINE}

whiptail --title "Modèle archivé" --msgbox "Le modèle ${ACTIVITE}_${DOMAINE} a été ${ACTION}." 10 60

