---
title: "Archivage"
confluence_id: 57771329
sidebar_position: 60
---
# Stockage hiérarchisé

BlueMind intègre un mécanisme de stockage hiérarchisé (HSM pour Hierarchical Stockage Management). Celui-ci permet de répartir les messages sur plusieurs serveurs de stockage, généralement avec des performances et pour un coût différents.

Le stockage hiérarchisé BlueMind, à la différences des archives PST par exemple, est géré coté serveur : il permet de centraliser la gestion des mails coté serveur (les archives PST générées avec Outlook restent quant à elles sur les postes des utilisateurs et doivent donc être sauvegardées).

Le stockage hiérarchisé permet de définir un espace de stockage différencié, généralement pour bénéficier d'un stockage plus important mais à moindre performances (et moindre coût). Ce mécanisme a les caractéristiques suivantes :

- règles de routage entre les différents stockage gérés par l'administrateur (âge du mail de plus de X jours, taille du message, ...)
- consultation des mails quel que soit le serveur de stockage, depuis le webmail BlueMind et les clients lourds (Thunderbird, Outlook,..), de façon transparente pour l'utilisateur.


![](../../attachments/57771329/58592746.png)

![](../../attachments/57771329/58592744.png) A partir de BlueMind 4.0, l'archivage devient ainsi exclusivement une fonctionnalité d'exploitation : le système est entièrement automatisé, il est transparent pour les utilisateurs qui n'ont pas de visibilité sur le serveur réellement utilisé pour leurs messages.

## Mettre en œuvre une politique de stockage hiérarchisé

Pour mettre en œuvre HSM, dans la console d'administration :

- se rendre dans Gestion du système > Configuration Système > onglet Messagerie
- activer la case à cocher de la section Archivage et remplir :
    - Nombre de jours avant archivage : nombre de jours avant qu'un message soit archivé
    - Taille de messages (MiB) : seuil à partir duquel un message est automatiquement archivé, sans attendre le nombre de jours
La valeur par défaut est 1Mb


:::info

L'unité MiB (MebiByte) est un multiple du byte (octet) à différencier du MB (megabyte, ou Mo méga-octet) : il représente 1024 kebibytes, lui-même représentant 1024 bytes (octets).

Ainsi 9 MiB sont équivalents à 9,43718 MB (Mo)

:::


Les règles de routage des e-mails entre les serveurs s’exécutent tous les jours à 4h du matin GMT.

## Mettre en place un espace de stockage hiérarchisé

Le montage doit être réalisé dans le dossier `/var/spool/bm-hsm/cyrus-archives/`

## Changement par rapport à BlueMind 3.5

Le stockage hiérarchisé est totalement transparent pour les utilisateurs. Par rapport à la version 3.5 :
- l'archivage manuel n'est donc plus possible pour les utilisateurs mais aussi
- La politique HSM est la même pour tous les utilisateurs du domaine
- Il n'y a plus de quota spécifique pour les archives, par groupe ou utilisateur. Il n'y a plus qu'un seul quota, les e-mails, quel que soit le serveur, sont comptabilisées dans un quota unique.
- Les tâches planifiées HSMJob et HSMIndexJob n'ayant donc plus lieu d'être, elles n'existent plus.


