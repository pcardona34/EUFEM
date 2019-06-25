s/@(//g
s/)@//g

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

