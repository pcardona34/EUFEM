#!/bin/bash

source ./CONF/atelier.ini

whiptail --title "Création d'un modèle" \
--msgbox "Un modèle sera créé à partir de l'atelier actuel : $ATELIER..." 8 60

DOMAINE=$(whiptail --title "Description du modèle (1)" \
--inputbox "Matière ou domaine ?" 10 60 "DOMAINE" 3>&1 1>&2 2>&3)

ACTIVITE=$(whiptail --title "Description du modèle (2)" \
--inputbox "Activité (cours, méthode, évaluation) ?" 10 60 "ACTIVITE" 3>&1 1>&2 2>&3)

cp --recursive ATELIER/$ATELIER ATELIER/${ACTIVITE}_${DOMAINE}
mv ATELIER/${ACTIVITE}_${DOMAINE}/SOURCE/source_${ATELIER}.md ATELIER/${ACTIVITE}_${DOMAINE}/SOURCE/source_${ACTIVITE}_${DOMAINE}.md

if (whiptail --title "Personnalisation" \
--yesno "Voulez-vous personnaliser le fichier source de ce modèle ?" 10 60)
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

