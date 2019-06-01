# Usages avancés

Il est possible d'adapter un modèle en jouant sur les scripts du dossier 
`MODS` en lien avec les variables définies dans `INI/champs.ini` de l'atelier courant.

Quand vous serez satisfait.e de l'adaptation de votre modèle, il sera 
possible de l'enregistrer en tant que nouveau modèle :

		Action : `Archiver l'atelier courant comme un modèle` 

# Comment utiliser le diaporama d'images ?

Il est possible de générer automatiquement un diaporama d'images à incoporer dans votre présentation.

1. Copiez dans le dossier `IMG` de EUFEM le ou les dossiers contenant des images.
2. Propagez ces images dans l'atelier courant : menu `Edition / propager les images...`
3. Créez les sections diaporamas : menu `Edition / Générer des diaporamas...`
4. Copiez le contenu du fichier `diaporama*.md` qui vous intéresse dans votre fichier source principal.  

**Actuce** : avec l'éditeur _nano_, utilisez le raccourci `CTRL+R` afin 
d'incorporer un fichier secondaire.

# Et les autres formats : HTML ? etc.

Il est bien sûr possible d'étendre les formats de sortie : il suffit de 
créer le script ad hoc dans le dossier MODS du modèle que l'on souhaite 
faire évoluer.

Pour en savoir plus, consultez l'aide de pandoc :

    [Démos de pandoc](https://pandoc.org/demos.html)

