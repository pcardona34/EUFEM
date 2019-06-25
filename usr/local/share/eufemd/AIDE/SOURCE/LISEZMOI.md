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

REMARQUE : il ne faut pas ajouter ce séparateur de diapo manuel après les 
titres de niveaux 1 et 2 pour lesquels ce saut est automatique.

# Comment utiliser EUFEM ?

Le plus simple consiste à ouvrir un terminal et à exécuter la commande :

		eufemd

Les items des menus sont explicites et accessibles au moyen d'une lettre, par 
exemple `E` pour accéder au menu `(E)dition`...

1. On choisit d'abord l'action : `C. Propriétés de l'atelier (c)ourant`,  
on renseigne alors le fichier des paramètres de l'atelier actuel ou à créer.
2. On édite le fichier source unique via le menu `E. (E)diter cet atelier...`  
 puis, dans le menu `Edition`, on choisit l'action :  
 `E. (E)diter le fichier source`
3. On génère ensuite les PDF en une seule opération grâce à l'action :  
`P. Générer tous les (P)DF`
4. Pour les visualiser, on retourne dans le `menu principal` (R)  
puis on choisit l'action :  
`V. (V)isionneuse PDF` 
5. Si besoin, on recommence ce cycle...

# Comment incorporer des images ou un diaporama ?

+ Les images demeurent en-dehors de l'atelier de EUFEMD.
+ Pour insérer une image ou un diaporama, il suffit :

1. De saisir la balise image `IMGxx` dans le fichier source à l'endroit
désiré, sur une ligne isolée, par exemple :

		IMG01

2. Puis dans le menu `Edition`, on utilise l'item `I. Incorporer des (I)mages`
pour afficher un sélecteur de fichier et choisir une images dans un dossier de 
son choix. Si EUFEMD détecte la présence d'autres images dans le même dossier,
il proposera alors de générer automatiquement un diaporama...

3. Au moment de la génération des documents, les images seront incorporées 
automatiquement à la présentation, et aux versions papier si vous avez choisi
cette option dans les propriétés de l'atelier courant.


# Comment (ne pas) incorporer les images dans la version papier ?

+ Il suffit de modifier l'option _ad hoc_ dans le fichier 
`CONF/atelier.ini` édité au moyen de l'action 
`C. Propriétés de l'atelier (c)ourant` :

	        `IMAGES=true`  # affichera les images dans la version papier
        	`IMAGES=false` # masquera les images dans la version papier

# Modèles

EUFEM utilise des modèles pédagogiques. Par exemple pour un cours en 
littérature, on pourra choisir le modèle COURS_LITTERATURE.

Le choix du modèle est proposé lors de la création d'un nouvel atelier : ce 
dernier est en effet créé si le nom d'atelier saisi n'existe pas encore...

# Pour modifier le fichier source unique

+ Menu : `E (E)diter cet atelier` / `E (E)diter le fichier source`

# Pour obtenir les fichiers PDF

+ Menu : `E. (E)diter cet atelier` / `P. Générer tous les (P)DF`
+ Puis `R (R)etour au menu principal` / `P. (P)ublier les PDF`

**Remarque** : lors de cette publication, une copie 
des fichiers papier sera déposée dans le dossier prévu pour les 
impressions rapides dans votre forge. Les chemins idoines sont indiqués 
dans le fichier `CONF/atelier.ini` éditable au moyen de l'action:  
 `C. Propriétés de l'atelier (c)ourant`...

# Voir aussi...

+ [Installation de EUFEM](../Installation_Eufem.pdf)
+ [Usages avancés](../Usages_avances.pdf)

