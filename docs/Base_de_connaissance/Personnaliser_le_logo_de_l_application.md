---
title: "Personnaliser le logo de l'application"
confluence_id: 57771947
sidebar_position: 68
---
# Personnaliser le logo de l'application


Le logo par défaut BlueMind, visible sur l'écran de connexion et dans le bandeau de navigation de BlueMind peut désormais être personnalisé et remplacé par une image de votre choix.

## Résultat de la personnalisation

Une fois le logo personnalisé, il se présente comme suit dans les différentes parties de BlueMind :

- sur la page d'accueil, en lieu et place du logo BlueMind, apparaît le nouveau logo encadré de blanc. Le logo BlueMind est alors toujours visible sous le formulaire de connexion :![](../attachments/57771947/57771949.png)
- dans le bandeau, une fois connecté, le logo personnalisé apparaît en haut à gauche.Le logo BlueMind est partiellement présent à sa gauche, lorsque l'utilisateur passe la souris dessus, le logo se déroule et informe sur la version actuelle de BlueMind :![](../attachments/57771947/57771948.png)


## Préparation de l'image

Le nouveau logo doit respecter les prérequis suivants :

- Format : [PNG](https://fr.wikipedia.org/wiki/Portable_Network_Graphics)
- Dimensions (l,h) : 140x40 pixelsSi les dimensions ne sont pas respectées, l'image sera automatiquement redimensionnée afin de pouvoir être intégrée dans l'espace défini. Il est donc recommandé de porter une attention particulière aux proportions de l'image.


La couleur de fond est le bleu foncé, ainsi toutes les zones transparentes de l'image apparaîtront bleu foncé aux utilisateurs. Pour une autre couleur de fond, remplacez les zones transparentes de votre image par la couleur souhaitée.

## Mise en œuvre

### Mettre en place un nouveau logo

Tapez la commande suivante :


```
curl -X PUT --header 'X-BM-ApiKey: TOKEN\_ADMIN0' -H "Content-Type: application/octet-stream" --data-binary "@/path/to/logo.png" 'https://mail.bluemind.loc/api/system/installation/logo'
```


En remplaçant :

- `TOKEN_ADMIN0` : le *token* de l'admin0, lui seul peut modifier l'image.


:::tip

le token se trouve dans le fichier `/etc/bm/bm-core.tok`

:::

- `@/path/to/logo.png` : le chemin vers le fichier image.
Il peut s'agir d'un chemin local (le fichier se trouve sur la machine sur laquelle est effectuée la manipulation) ou distant.


:::info

Il faut toujours conserver le symbole @ devant le chemin en cas d'utilisation d'un chemin local.

:::

- `mail.bluemind.loc` : l'url du BlueMind concerné


### Revenir au logo initial

Pour revenir au logo par défaut de BlueMind, il suffit de supprimer le logo personnalisé :


```
curl -X DELETE --header 'X-BM-ApiKey: TOKEN\_ADMIN0' 'https://mail.bluemind.loc/api/system/installation/logo'
```


En remplaçant :

- `TOKEN_ADMIN0` : le *token* de l'admin0, lui seul peut modifier l'image.
NB : Si le *token* est incorrect, une erreur "*PERMISSION DENIED*" est retournée

- `mail.bluemind.loc` : l'url du BlueMind concerné


Enregistrer

Enregistrer

Enregistrer

