---
title: "L'essentiel de la syntaxe Markdown"
sidebar_position: 10
---

# En tête de page

=> Titre : par défaut le titre est le nom de fichier. Le remplacer par un titre lisible (sans les _, avec les accents, ...)

=> sidebar_position : permet de positionner la page. Numéroter les pages de 10 en 10 pour pouvoir éventuellement insérer de nouvelles pages sans devoir refaire toute la numérotation

# Mise en page

## Traitement de texte
- Titres : 
  - # Titre 1 
  - ## Titre 2 
  - ### Titre 3
- Mettre en gras : **texte** 
- Mettre en italique : *texte*
- Mettre en gras italique : ***texte***
- Souligner : <u>texte</u>
- Mettre en couleur : <span style="color:#99cc00;">texte</span>
  
  Codes BlueMind : 
    - #999999 (gris) 
    - #55c1ea (bleu clair) 
    - #000000 (noir) 
    - #ffffff (blanc) 
    - #002e6a (bleu foncé) 
    - #cc0000 (rouge) 
    - #fe9300 (orange)

## Insertion de liens
- Lien vers le web : [texte](https://docusaurus.io/fr/docs/markdown-features)
- Lien vers une page de la documentation : [texte](README.md)
- Lien vers un paragraphe d'une page de la documentation : [texte](../bluemind-doc/docs/Guide_de_l_utilisateur/L_agenda/Découvrir_l_agenda.md/#accéder-à-lagenda)

## Insérer une image
- Classer les images de la page dans un dossier nommé avec le nom de la page_attachments (exemple : syntax_attachments)
- Indiquer le lien vers l'image ![](../bluemind-doc/syntax_attachments/logo%20BM%20bleu.png)
- Pour redimensionner l'image à insérer, utiliser le format HTML : <img src=../bluemind-doc/syntax_attachments/logo%20BM%20bleu.png width="63" height="17"> et indiquer la taille de l'image souhaitée. Attention de respecter le ratio longueur/hauteur pour ne pas créer de distorsion


## Insérer un symbole ou un emoji
- Installer le plugin "Markdown Emoji"
- Utiliser le shortcode de la liste : https://gist.github.com/rxaviers/7360908 - par exemple :smiley:
- Pour insérer un symbole (par exemple le symbole du copyright) : &nom du symbole; - voir la liste des symboles : https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references

## Faire un tableau
- Installer le plugin "Markdown table Prefitter"
- écrire la syntaxe suivante :

| en tête | en tête |
| --- | --- |
| ligne 1 | texte |
| ligne 2 | texte |

## Insérer des blocs "info"

### Bloc Remarque
:::note

Texte de la remarque.

:::

### Bloc Astuce
:::tip

Texte de l'astuce.

:::

### Bloc Information
:::info

Texte de l'information.

:::

### Bloc Attention
:::caution

Texte de la mise en garde.

:::

### Bloc Danger
:::danger

Texte du danger.

:::


# Liens utiles : 
 - Guide Markdown : https://www.markdownguide.org/
 - Fonctionnalités Markdown (Docusaurus) : https://docusaurus.io/fr/docs/markdown-features
