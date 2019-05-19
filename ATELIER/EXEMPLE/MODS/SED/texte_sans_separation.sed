# Avant de supprimer les marqueurs de nouvelle diapo,
# on protège les lignes d'en-tête des tableaux...
s/|---/|§§§/g
s/|:---/|:§§§/g
s/|---:/|§§§:/g
s/|:---:/|:§§§:/g

# On supprime les séparateurs de diapo...
s/---//g

# On rétablit les en-têtes de tableau...
s/|§§§/|---/g
s/|:§§§/|:---/g
s/|§§§:/|---:/g
s/|:§§§:/|:---:/g


