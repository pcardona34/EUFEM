# La mini-chaîne éditoriale EUFEM[^1]

[^1]: EUFEM : Écrire Une Fois En Markdown...

## Principe :

On saisit sa trace de cours dans un fichier Markdown unique.  
À partir de ce fichier, on génère automatiquement :

1. Une présentation au format Beamer / PDF
2. Une prise de notes papier (format A4)
3. La même prise de notes, avec des trous pour la prise de notes des élèves/étudiant.e.s

Il est possible de choisir d'incorporer les images seulement dans la présentation et de les exclure de la version papier, ou de les y conserver (voir la section Images)

# Pour utiliser efficacement EUFEM

Il est important de connaître la syntaxe standard du Markdown et sa version améliorée

Voyez ces liens : 

+ [le langage markdown](https://enacit1.epfl.ch/markdown-pandoc/#le-langage-markdown)
+ [CommonMark](https://commonmark.org/)

# Comment saisir des "trous" dans le fichier source ?

Pour rendre possible ce repérage, il a fallu ajouter une balise : `@(` à gauche et `)@` 
à droite.

	Ceci est un exemple de @(mot)@ à deviner.

Ce qui donnera dans la prise de notes trouée :

> Ceci est un exemple de _ _ _ _ _ _ _ _ _ _ _ _ à deviner.

Et dans la prise de notes complète :

> Ceci est un exemple de mot à deviner.

# Comment saisir des diapositives pour la présentation ?

+ Le niveau de titre 1 (un dièse `#`) présentera ce titre centré 
verticalement et marquera le début d'une nouvelle diapo.

+ Un titre de niveau 2 (deux dièses : `##`) présentera le titre en haut 
de la diapo et le reste du contenu au-dessous, et il marquera le début 
d'une nouvelle diapo.

+ Le niveau de titre 3 (trois dièses : `###`) servira à créer un cadre 
de mise en évidence (définition, mise en garde, etc.) sans constituer le 
début d'une nouvelle diapo.

Pour indiquer un changement de diapositive (saut de page) au sein du 
texte de base : paragraphe, liste, etc, il suffit d'ajouter trois 
tirets consécutifs : `---` précédés et suivis d'une ligne vierge. Cette 
convention marquera le début d'une nouvelle diapo dans la présentation, 
mais ne sera pas visible dans les versions papier.

	Une fin de diapo.

	---

	Une nouvelle diapo débute ici...

REMARQUE : il ne faut pas utiliser ce saut de diapo manuel après les 
titres de niveaux 1 et 2 pour lesquels ce saut est automatique.

# Comment utiliser EUFEM ?

Le plus simple consiste à exécuter le script ./eufem.sh dans un terminal... Les items 
sont explicites...

1. On choisit d'abord l'action : `1. Propriétés de l'atelier courant`,  
on renseigne alors le fichier des paramètres de l'atelier actuel ou à créer.
2. On édite le fichier source unique via le menu `2. Editer cet atelier...`  
 puis, dans le menu `Edition`, on choisit l'action :  
 `2. Editer la source`
3. On génère les PDF en une seule opération grâce à l'action :  
`4. Générer tous les PDF`
4. Pour les visualiser, on retourne dans le `menu principal`  
puis on choisit l'action :  
`3. Visionneuse PDF` 
5. Si besoin, on recommence ce cycle...

# Où placer les images ?

+ Les images doivent être déposées dans le dossier `IMG` à la racine de 
EUFEM, le programme se chargeant de les propager ensuite au bon endroit 
grâce à la commande _ad hoc_ du menu `Edition` :
`1. Propager les images...`

+ Dans le fichier source, on indique le 
chemin à partir de ce dossier : `IMG/mon_image.png`. Par exemple :

	`![Légende de mon image](IMG/mon_image.png)`

---

# Comment (ne pas) incorporer les images dans la version papier ?

+ Il suffit de modifier l'option _ad hoc_ dans le fichier 
`CONF/atelier.ini` édité au moyen de l'action `Atelier courant` :

        `IMAGES=true` // affichera les images
        `IMAGES=false` // masquera les images

# Modèles

EUFEM utilise des modèles pédagogiques, par exemple pour un cours en 
littérature, on pourra choisir le modèle COURS_LITTERATURE.

Les modèles sont proposés lors de la création d'un nouvel atelier : ce 
dernier est créé si le nom d'atelier saisi n'existe pas encore...

# Pour modifier le fichier source unique

+ Menu : `Editer cet atelier` / `Editer la source`

# Pour obtenir les fichiers PDF

+ Menu : `Editer cet atelier` / `Générer les PDF`
+ Puis `Retour au menu principal` / `Publier les PDF`

**Remarque** : lors de cette publication, une copie 
des fichiers papiers sera déposée dans le dossier prévu pour les 
impressions rapides dans votre forge. Les chemins idoines sont indiqués 
dans le fichier `CONF/atelier.ini` éditable au moyen de l'action:  
 `Propriétés de l'atelier courant`...

# Voir aussi...

+ [Installation de EUFEM](../Installation_Eufem.pdf)
+ [Usages avancés](../Usages_avances.pdf)

