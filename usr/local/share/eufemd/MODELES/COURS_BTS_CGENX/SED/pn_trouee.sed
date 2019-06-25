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


/IMG/d


s/@(/<!--/g
s/)@/--> _ _ _ _ _ _ _ _ _ _ _ \\_ /g

# But : rétablir les règles de la typographie française

# Guillemets ouvrants

s/ "/ \&laquo;\&nbsp;/g
s/ \*"/ *\&laquo;\&nbsp;/g
s/ \*\*"/ \*\*\&laquo;\&nbsp;/g
s/ \_"/ \_\&laquo;\&nbsp;/g

# Guillemets fermants

s/"/\&nbsp;\&raquo;/g

# Signes de ponctuation composés ":" et ";"

s/ :/\&nbsp;:/g
s/ ;/\&nbsp;;/g

# Espace insécable suggéré par ~
s/~/\&nbsp;/g

