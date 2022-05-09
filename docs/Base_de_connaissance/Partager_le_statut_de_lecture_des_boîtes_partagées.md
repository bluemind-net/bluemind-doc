---
title: "Partager le statut de lecture des boîtes partagées"
confluence_id: 57771944
sidebar_position: 66
---
# Partager le statut de lecture des boîtes partagées


:::info

Changement de comportement dans BlueMind 4.5

Cette documentation est valable pour les versions 4.0 à 4.4.x, à partir de BlueMind 4.5 le statut de lecture des boîtes est obligatoirement partagé entre les utilisateurs. Ce comportement n'est plus modifiable par les administrateurs et n'est pas paramétrable.

:::

## Présentation

Le fonctionnement par défaut des boîtes partagées veut que le statut de lecture des messages de la boîte est individuel : chaque utilisateur a son propre statut et voit ainsi les messages qu'il a personnellement lus ou pas, indépendamment de l'ouverture des messages par les autres utilisateurs.

Dans certains cas, le processus de gestion des messages est tel que les personnes souhaitent partager le statut de lecture afin de voir comme lu un email qui a été lu par un collaborateur, ou comme non lu un message que personne n'a consulté.

## Mise en œuvre

Le partage peut être forcé en passant par cyrus directement. Pour cela, sur le serveur hébergeant BlueMind il faut se connecter sur cyrus avec cyradm :


```
cyradm --user admin0 localhost --port 1143
```


Puis passer la commande suivante **pour chaque boîte souhaitée** :


```
mboxcfg "user/nom-de-la-boite\*@mydomain.tld" sharedseen true
```


Il faut ensuite **refaire l'indexation de la boîte** :

- Se rendre dans la fiche d'administration de la boîte de la console d'administration BlueMind > onglet Maintenance > exécuter "Reconstruire l’index de la boîte aux lettres" :


![](../attachments/57771944/57771946.png)

