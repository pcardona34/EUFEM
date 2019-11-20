# Test pour md2pdf
# Moteur LaTeX papier : lualatex

## Test de tableau (1)

: Un tableau simple au format PHP

| Version | Date | Paragraphe | Description | Auteur |
|:--------|:------------|---------|:------------------|-------|
| 1.0 | 12/04/19 | All | qqch | Untel |
| 1.0 | 12/04/19 | All | qqch | Untel |

---

+ Remarque :

Echec du tableau multiligne ou de type grille avec des séparateurs +.

## Un tableau au format LaTeX


\arrayrulecolor{blue}
\begin{tabular}{|l|l|l|l|}
\hline
\rowcolor[gray]{0.85}
gauche & centre & droite & encore \\ \hline \hline
a & b & c & d \\ \hline
1 & 2 & 3 & 4 \\ \hline
\end{tabular}

## Mise en évidence

Texte en **gras** et en _italique_.

## Liste à puces

+ Item 1
+ Item 2
+ Item 3

## Liste numérotée

#. Item 1
#. Item 2
#. Item 3

## Un bloc d'alerte

### Une alerte

zzz

## Un bloc de citation

Une citation :

> "Ceci est une citation
> d'un texte quelconque..."

## Un bloc de citation avec mots mis en évidence

Une citation :

> "Ceci est une **citation**
> d'un texte _quelconque_..."

## Une diapo scindée

+ Première partie...

---

+ Fin.

## Une diapo avec des pauses

+ D'abord...

\\pause

+ Ensuite...

\\pause

+ Enfin.

## QCM

Une case à cocher...

@QCM
[] Un item à cocher.
[x] Un item coché.
@FINQCM
