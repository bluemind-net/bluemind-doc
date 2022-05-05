---
title: "Plan de Reprise d'Activité (PRA)"
confluence_id: 57771731
position: 52
---
# Plan de Reprise d'Activité (PRA)


## Présentation

Cette documentation décrit la procédure de PRA permettant de remonter une architecture BlueMind à partir d'une sauvegarde. La restauration d'un serveur peut prendre beaucoup de temps et ne devrait être utilisé qu'en dernier recours.


## Pré-requis

1. ré-installer l'architecture (l'**ensemble des serveurs**) BlueMind à l'identique :
    - mêmes dimensionnement et partitionnement (taille des disques, répartition des partitions, accès NFS, etc.)
    - mêmes adresses IP
    - même URL externe
    - même version de BlueMind
    - lorsque cela est possible, il est aussi préférable d'avoir des OS identiques de même version


:::tip

Si la reprise s'effectue sur un serveur Ubuntu en version 18.04 alors Python doit être installé en **version 2.7**

:::

2. jouer le setup wizard de BlueMind
3. rendre accessible **en lecture et écriture** les données de backup BlueMind à restaurer dans le dossier `/var/backups/bluemind` **depuis l'ensemble des nœuds BlueMind**


## Procédure

**Sur chaque nœud BlueMind**, exécuter la commande :


```
/usr/share/bm-node/bm-pra-restore.py
```


L'outil liste les générations de sauvegardes disponibles et permet de choisir quelle génération vous souhaitez restaurer.


:::info

Choisissez la même génération sur chacun des nœuds BlueMind.

:::

Le PRA est terminé lorsque la commande a été jouée avec succès sur l'ensemble des nœuds de l'architecture BlueMind.

## Post-opérations

1. Si vous disposez d'une souscription, réinstallez celle-ci en suivant le guide d'installation : [Mise en œuvre de la souscription](https://forge.bluemind.net/confluence/display/BM35/Mise+en+oeuvre+de+la+souscription)
2. Se connecter à la console d'administration, en tant qu'* [admin0@global.virt](mailto:admin0@global.virt) * puis :
    - se rendre dans Sécurité > Gestion du pare-feu > cliquer sur le bouton « Enregistrer »Ceci force la re-génération des règles du pare-feu BlueMind
    - se rendre dans Gestion du système > Maintenance des mails > cliquer sur le bouton « Exécuter »Ceci permet de re-générer les tables de routage de mails postfix
    - se rendre dans Sécurité > Modifier le certificat et réinstaller le certificat SSLNB : le certificat, sa clé privée ainsi que le(s) certificat(s) de la CA sont disponibles dans le fichier `/etc/ssl/certs/bm_cert.pem` sur le serveur BlueMind
3. Réinstaller les éventuels plugins nécessaires (import LDAP/AD...).


