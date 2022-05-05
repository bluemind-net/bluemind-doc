---
title: "Mise en œuvre de MAPI pour Outlook"
confluence_id: 57771792
position: 58
---
# Mise en œuvre de MAPI pour Outlook


## Présentation

La synchronisation d'Outlook avec BlueMind 4.0 ne nécessite plus l'installation d'un connecteur sur les postes clients. Cependant, certaines opérations doivent être réalisées côté serveur afin de permettre aux logiciels Outlook du réseau de se connecter à BlueMind.


:::info

La fonctionnalité MAPI en 4 est en production chez de nombreux clients. Elle est toutefois dans une phase de fiabilisation. Elle est désactivée par défaut.  Nous vous invitons donc à [vous rapprocher de votre interlocuteur habituel ou de nous contacter pour définir dans quel cadre cette fonctionnalité peut être activée pour votre installation ou projet](https://content.bluemind.net/decouvrez-bluemind-4-0).

:::


:::info

Avertissement de sécurité

Nous rappelons qu'il est conseillé de travailler sur des machines virtuelles en utilisant des snapshots, afin de vous permettre un retour en arrière si vous rencontrez une erreur.

:::

## Compatibilité

### Outlook pour Mac

Les protocoles de communication étant différents, BlueMind ne supporte que les versions d'Outlook **pour Windows**.

**BlueMind ne peut donc garantir le bon fonctionnement avec les versions d'Outlook pour MacOS.**

### Outlook pour Windows

Vérifiez le support de vos versions d'Outlook dans notre page [Compatibilité#Compatibilite-compat-outlookOutlook](https://forge.bluemind.net/confluence/display/LATEST/Compatibilite)

### Outlook.com sur les smartphones

L'application Outlook.com pour smartphones n'est pas recommandée. Dans ce mode d'utilisation, le flux de messagerie passe par les serveurs de Microsoft et ces derniers stockent les données de votre compte de messagerie BlueMind.

## Fonctionnalités

### Dossiers sous la boîte de réception

Dans les versions 4.0.x de BlueMind (4.0.x), les dossiers créés sous la boîte de réception par Outlook ne sont pas des dossiers de messagerie mais des dossiers virtuels.

**BlueMind 4.1 apporte le support des sous-dossiers de la boîte de réception (inbox)**.


:::info

Mise à jour 4.0.x vers 4.x

****Attention :**** dans le cadre d'une mise à jour de BlueMind 4.0.x vers 4.1 ou supérieure, les dossiers virtuels ne seront pas migrés et seront supprimés.

Pour se prémunir de cela, il est possible de déplacer ces dossiers virtuels en dehors de la boîte de réception **avant la mise à jour** de façon à les conserver, ils pourront ensuite y être remis et seront recréés en tant que dossiers de messagerie.

:::

### Pièces jointes aux événements d'agenda

Parallèlement à [l'application d'Agenda en ligne](/Guide_de_l_utilisateur/L_agenda/Les_événements/) de BlueMind, la version 4.1 permet de joindre des fichiers aux événements d'agenda depuis Outlook.

## Pré-requis

1. Avoir installé [BlueMind en version 4.0](https://download.bluemind.net/bm-download/4.0)
2. Les adresses suivantes de BlueMind doivent être joignables en HTTPS depuis les postes clients :
    - url externe (*external-url*) du serveur (par exemple **  [https://mail.bluemind.loc](https://mail.bluemind.loc)  ** )
    - url d'*autodiscover* - généralement formée en remplaçant la 1ère partie de l'url externe par le mot clef "`autodiscover`"(par exemple **[https://autodiscover.bluemind.loc](https://autodiscover.bluemind.loc))** qui doit aussi pointer sur l'external-url de BlueMind


:::info

**Outlook en mode MAPI ne peut fonctionner sans un autodiscover correctement configuré**. Au démarrage, le service MAPI vérifie que l'autodiscover est configuré pour le domaine ou au moins un de ses alias ; **dans le cas contraire, le service MAPI ne démarre pas**.

Pour s'assurer que le serveur est correctement configuré et joignable, on pourra utiliser l'outil de diagnostique en ligne de Microsoft : [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/)

:::
3. En accédant à ces adresses depuis un navigateur, **aucun avertissement de sécurité relatif au certificat ssl ne doit s'afficher**.


:::info

Autodiscover

Le service mapi requiert l'enregistrement autodiscover sur l'ensemble des domaines de messagerie hébergés par le serveur. Dans le cas contraire, vous pouvez outrepasser la vérification des enregistrements autodiscover en créant le fichier vide /etc/bm/non.blocking.checks puis en redémarrant bm-mapi.

:::

## Mise en œuvre


:::tip

Mise en œuvre rapide d'un environnement d'évaluation

Pour une mise en œuvre rapide d'un environnement d'évaluation, vous pouvez consulter l'article suivant de notre blog : [BM 4.0 beta + Outlook : pas à pas](https://blog.bluemind.net/fr/bm-4-0-beta-outlook-pas-a-pas/)

:::

L'installation doit être réalisée ** **avant de créer les utilisateurs qui utiliseront Outlook** ** :

- [Déployer la souscription](/Guide_d_installation/Mise_en_œuvre_de_la_souscription/)
- Installer les paquets nécessaires :


**
Debian/Ubuntu


**
RedHat/CentOS


```
$ aptitude install bm-mapi
```


```
$ yum install bm-mapi
```


*NB : le redémarrage de BlueMind n'est pas nécessaire*

- Se connecter à la console d'administration de BlueMind et [créer les utilisateurs](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/) **en leur affectant une adresse email**.


Dès lors, vous pouvez vous référer à la page suivante afin de configurer les postes Outlook : [Synchronisation avec Outlook](/Guide_de_l_utilisateur/Configuration_des_clients_lourds/Synchronisation_avec_Outlook/)


