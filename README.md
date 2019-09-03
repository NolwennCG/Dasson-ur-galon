# Projet Dasson ur Galon (DUG)

## Présentation du projet

« Dasson ur Galon » est un projet mon mémoire de deuxième année de Master Lettres, Parcours Éditons numériques et imprimées de textes littéraires (2018 - 2019) sous la direction de Nathalie GASIGLIA et Mathieu MARCHAL. Ce projet vise à la numérisation, la normalisation et l’encodage du recueil de *Dasson ur Galon* de Loeiz Herrieu. 

Plus d'informations sur le projet sur le site internet du projet. 

### Equipe scientifique du projet

Nolwenn CHEVALIER (Université de Lille)

## Normes de transcription

- pour que les transformations soient correctement effectuées les fichiers .odt doivent appliquer les styles définis dans `ODT/MM2_DUG_Modele.odt`

## Informations techniques

- Le balisage des fichiers XML-TEI respecte la norme TEI

## Transformation .odt vers XML-TEI


### Les transformations XSTL
Les transformations sont à appliquer à partir du fichier `content.xml` contenu dans l'.odt. Pour le récupérer, vous pouvez ouvrir le .odt dans Oxygen XML editor ou l'éxtraire à partir de l'odt transformé en .zip. 
Sept transformations sont à exécuter dans l'ordre pour transformer l'.odt en .html:

1. `1_ODTversXML.xslt`
2. `Poeme_2A_XMLversTEI.xsl`
3. `Poeme_2B_XMLversTEI-attr.xsl`
4. `Poeme_3_Cmp_XMLversHTML.xsl` ou `Poeme_3_Norm_XMLversHTML.xsl`

#### 1. ODT vers XML
- transformation : `1_ODTversXML.xslt`
- format : .odt > .xml
- transforme le fichier `content.xml` pour le rendre travaillable
#### 2. XML vers XML-TEI
- transformation : `Poeme_2A_XMLversTEI.xsl`
- format : .xml > .xml
- prend en charge : 
  - nettoyer les balises parasites
  - création du `<header>`
  - ajoute les `<choice>`
  - `<pb>`, `<lg>`, références bibliographiques, etc.
#### 3. + ajout des catégories aux attributs
- transformation : `Poeme_2B_XMLversTEI-attr.xsl`
- format : .xml > .xml
- ajoute des catégories aux différentes normalisations pour permettre leur hiérarchisation (cette transformation est prépare à `checkboxes.js`)
#### 4. XML-TEI vers HTML (normalisée)
- transformation : `Poeme_3_Norm_XMLversHTML.xsl`
- format : .xml > .html
- sortie HTML : le texte s'affiche en deux colonnes (col 1 : normalisé ; col 2 : original)
- cette version est liée à `typographie.js`
#### 4. XML-TEI vers HTML (compilatoire)
- transformation : `Poeme_3_Cmp_XMLversHTML.xsl`
- format : .xml > .html
- sortie HTML : le texte compile la version normalisée est original (ex. : "mot[d]")
- cette version est liée à `checkboxes.js`

### Les script JavaScript
- `checkboxes.js` permet de créer des checkboxes des checkboxes de façon autonome
- `typographie.js` rectifie quelques points de la mise en page et certains éléments typohraphiques

## Structure des dossiers pour la constitution site internet

- MM2_DUG_Poemes contient tous les poèmes
  - sommaire normalisé : MM2_DUG_0.html
  - sommaire diplomatique : MM2_DUG_0D.html
  - poème normalisé : MM2_DUG_1.html (voir `suivi.ods`)
  - poème compilatoire : MM2_DUG_1D.html (voir `suivi.ods`)
- MM2_DUG_Images
  - contient les images
MM2_DUG_Javascript
  - contient script javascript
- MM2_DUG_General
  - contient les autres pages du site : `MM2_DUG_Accueil.html`, `MM2_DUG_Bibliographie.html`, `MM2_DUG_Glossaire.html`, `MM2_DUG_Introduction.html`, `MM2_DUG_Langue.html`, `MM2_DUG_Normalisation.html`
- MM2_DUG_CSS
  - contient les fichiers CSS
  
## Informations sur le corpus

Herrieu Loeiz, *Dasson ur galon*, Pontivy : Éditions Dihunamb, 1957, 253 p. 
