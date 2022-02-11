---
title: "Archivage"
confluence_id: 57771329
position: 60
---
# Archivage


# Présentation

BlueMind intègre un système d'archivage centralisé. Celui-ci permet de décharger les serveurs de stockage en stockant une partie des messages sur un point de montage différent dont les coûts de stockage sont inférieurs.

L'archivage BlueMind fonctionne coté serveur : il permet de centraliser les archives sur un seul et même serveur, contrairement aux archives PST générées avec Outlook qui restent sur les postes des utilisateurs et qu'il est donc nécessaire de sauvegarder.

Le stockage hiérarchique permet de définir un espace de stockage différencié, généralement pour bénéficier d'un stockage plus important mais à moindre performances (et moindre coût). BlueMind intègre un archivage basé sur ce stockage, avec les caractéristiques suivantes :

- règles d'archivages (âge du mail de plus de X jours, ...) pour le serveur
- consultation des archives directement depuis le webmail BlueMind et les clients lourds (Thunderbird, Outlook,..), de la même façon qu'un mail non archivé.


![](../../attachments/57771329/58592746.png)

![](../../attachments/57771329/58592744.png) Dans BlueMind 4.0, l'archivage devient une fonctionnalité d'exploitation : le système est entièrement automatisé, il est transparent pour les utilisateurs qui n'ont plus le bouton d'archivage manuel ni la visibilité de l'archivage (ou non) d'un message.

# Mettre en œuvre une politique d'archivage

Pour mettre en œuvre l'archivage, dans la console d'administration :

- se rendre dans Gestion du système > Configuration Système > onglet Messagerie
- activer la case à cocher de la section Archivage et remplir :
  - Nombre de jours avant archivage : nombre de jours avant qu'un message soit archivé
  - 
Taille de messages (MiB) : seuil à partir duquel un message est automatiquement archivé, sans attendre le nombre de jours
La valeur par défaut est 1Mb
:::important

L'unité MiB (MebiByte) est un multiple du byte (octet) à différencier du MB (megabyte, ou Mo méga-octet) : il représente 1024 kebibytes, lui-même représentant 1024 bytes (octets).

Ainsi 9 MiB sont équivalents à 9,43718 MB (Mo)

:::


L'action d'archivage s’exécute tous les jours à 4h du matin GMT.

# Mettre en place un espace d'archivage

Le montage doit être réalisé dans le dossier `/var/spool/bm-hsm/cyrus-archives/`

# Changement par rapport à BlueMind 3.5

Le changement de système d'archivage pour un système entièrement automatisé implique plusieurs conséquences. Comme nous l'avons dit plus haut, l'archivage manuel n'est donc plus possible pour les utilisateurs mais aussi :

- La politique d'archivage est la même pour tous les utilisateurs du domaine
- Il n'y a plus de quota d'archivage par groupe ou utilisateur. Il n'y a plus qu'un seul quota, les données archivées sont comptabilisées dans l'unique quota, en plus des autres mails non archivés.
- Les tâches planifiées HSMJob et HSMIndexJob n'ayant donc plus lieu d'être, elles n'existent plus.


