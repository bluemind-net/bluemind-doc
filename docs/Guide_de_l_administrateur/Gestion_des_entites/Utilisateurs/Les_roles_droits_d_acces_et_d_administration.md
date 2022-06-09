---
title: "Les rôles : droits d'accès et d'administration"
confluence_id: 57771478
sidebar_position: 56
---
# Les rôles : droits d'accès et d'administration


Les rôles attribuables aux utilisateurs peuvent être des droits d'accès aux applications (webmail, contacts, etc.), des droits d'utilisation de fonctionnalités particulières (se créer une identité externe, activer le renvoi automatique de messagerie, etc.) ou encore des droits d'administration afin de déléguer la gestion de certaines parties (utilisateurs, domaine, etc.).


:::info

Délégation des droits
Un administrateur ne peut déléguer que les droits qu'il possède lui-même, exception faite de l'accès aux applications ou à certaines fonctionnalités : par exemple même s'il n'a pas lui-même de messagerie, un administration peut activer "Messagerie et Contacts" aux utilisateurs dont il a la gestion ; de même il peut leur autoriser la création d'identité externes ou le transfert de message s'il ne les a pas lui-même.
:::

Voici les rôles attribuables aux utilisateurs :

** **Administration** **

- **Gestionnaire système** : permet de gérer toute l'installation BlueMind et sa configuration


:::info

Les rôle de gestionnaire système donne des droits équivalents à ceux de l'admin0 concernant tous les points ci-dessous.
Ainsi, le gestionnaire aura un accès total aux comptes des utilisateurs, paramétrage et données : messages, contacts, agenda. Accédant à leur agenda, le gestionnaire pourra donc voir jusqu'au détails de leurs événements privés, y compris lorsqu'il affichera leur agenda dans sa vue personnelle.

:::

    - **Console de monitoring** : accès à la console de monitoring
    - **Gérer la configuration du système** : permet de gérer la configuration des paramètres
    - **Gérer la souscription BlueMind** : permet d'installer et mettre à jour [la souscription](/Guide_de_l_administrateur/La_souscription_BlueMind/)
    - **Gérer les domaines**
        - **Administrateur de domaine**
            - **Gérer des utilisateurs externes** :  permet de créer et administrer des [Utilisateurs externes](/Guide_de_l_administrateur/Gestion_des_entites/Utilisateurs/Utilisateurs_externes/) 
            - **Gérer les boîtes partagées** : permet de créer, modifier ou supprimer des boîtes aux lettres partagées
                - **Gérer les partages des boîtes partagées** : permet de modifier les droits de partages des boîtes aux lettres partagées
            - **Gérer les calendriers de domaine** : permet de créer, modifier et supprimer des calendriers de domaine
                - **Gérer les partages des calendriers de domaine** : permet de modifier les droits de partage des calendriers de domaine
            - **Gérer les carnets d'adresses de domaine** : créer, modifier et supprimer des carnets d'adresses de domaine
                - **Gérer les partages des carnets d'adresses de domaine** : permet de modifier les droits de partage des carnets d'adresses de domaine
            - **Gérer les carnets d’adresses externes LDAP** : permet de créer, modifier ou supprimer des carnets d'adresses de domaine synchronisés à un LDAP externe
            - **Gérer les groupes** : permet de créer, modifier et supprimer des groupes
                - **Gérer les membres des groupes** : permet d'ajouter et supprimer des membres dans les groupes
                - **Gérer les partages des groupes** : permet d'attribuer, modifier ou supprimer les droits de partage sur les boîtes de messagerie des groupes
            - **Gérer les ressources** : permet de créer, modifier ou supprimer des ressources
                - **Gérer les partages des ressources** : permet de modifier les droits de partages des ressources
            - **Gérer les types de ressources** : permet de créer, modifier ou supprimer des types de ressources
            - **Gérer les unités d'organisation** : permet de créer et supprimer des unités d'organisation, utilisées pour la délégation d'administration
            - **Gérer les utilisateurs** : permet de créer, modifier et supprimer des utilisateurs
                - **Gérer des comptes externes** : permet de gérer les comptes externes des utilisateurs afin de remplacer le système de stockage des pièces jointes intégré à BlueMind par un gestionnaire externe si l'un d'eux est installé (voir [Connecter avec Nextcloud](/Guide_de_l_administrateur/Configuration/Detachement_des_pieces_jointes/Connecter_avec_Nextcloud/))
                - **Gérer les abonnements des utilisateurs** : permet de modifier les abonnements des utilisateurs aux carnets et calendriers partagés
                - **Gérer les appareils des utilisateurs (ActiveSync)** : permet d'autoriser ou lever les autorisations de synchronisation EAS des appareils tiers des utilisateurs
                - **Gérer les identités de messagerie des utilisateurs** : permet d'ajouter, modifier ou supprimer des identités aux utilisateurs
                - **Gérer les informations des utilisateurs** : permet de modifier les informations des utilisateurs destinées à apparaître dans l'annuaire (photo de profil, nom, coordonnées, etc.)
                - **Gérer les mots de passe des utilisateurs** : permet de modifier les mots de passe des utilisateurs
                - **Gérer les paramètres des utilisateurs** : permet de modifier les paramètres personnels des utilisateurs
                - **Gérer les partages des utilisateurs** : permet de gérer les droits de partages de la messagerie, des carnets d'adresses et calendriers des utilisateurs
            - **Manage domain dataprotect** : permet d'accéder à l'interface dataprotect afin de restaurer les données de tout le domaine
    - **Gérer les serveurs** : donne l'accès à la section "Serveurs de l'application" de la console d'administration, permet d'ajouter et supprimer les serveurs, ainsi que modifier leurs paramètres et leurs rôles
    - **Gérer les valeurs max du domaine** : gérer le nombre d'utilisateurs maximum autorisés sur le domaine
    - **Manage dataprotect**: permet d'accéder à l'interface dataprotect afin de restaurer les données des utilisateurs individuellement
    - **Sudo (élévation de privilèges)** : permet de se connecter à BlueMind à la place des utilisateurs sans connaître leur mot de passe


****Accès aux applications****

- **Messagerie et Contacts** : permet d’utiliser le service de messagerie, le webmail, la synchronisation des contacts et l’application web contact.
- **Agenda et Tâches** : permet de synchroniser les agendas et les tâches, et d’utiliser les applications web associées
- **Messagerie instantanée** : permet d’utiliser l’application web de messagerie instantanée et le service XMPP avec des clients tiers
- **Téléphonie** : permet d’utiliser l’intégration de la téléphonie dans les applications web
- **Console d'administration** : accès à la console d'administration - **nécessaire pour tous les rôles de gestion**
- **Gérer les signatures d'entreprise** : accès à l'application de [gestion des signatures et du disclaimer](/Guide_de_l_administrateur/Configuration/Signatures_d_entreprise/)
- **Intégration API docs** : permet d’accéder à la [documentation API](https://forge.bluemind.net/staging/doc/latest/web-resources/) de façon intégrée à BlueMind : un lien "API Docs" vient s'ajouter dans le bandeau du haut de BlueMind au côté des autres applications


** **Général** **

- **Modifier ses paramètres** : permet à l'utilisateur de modifier ses paramètres BlueMind
- **Changer son mot de passe** : permet à l'utilisateur de changer son mot de passe à tout moment
- **Modifier ses informations** : permet à l'utilisateur de modifier lui-même les informations qui seront visibles dans sa fiche de l'annuaireNB : aucune interface n'est à l'heure actuelle disponible dans la gestion des paramètres BlueMind de l'utilisateur, cette fonctionnalité permet des actions par script au moyen de la  clef API de l'utilisateur (voir [Paramètres utilisateur - chapitre 6 Clés d'API](/Guide_de_l_utilisateur/Paramètres_utilisateur/))
- **Gérer ses appareils (ActiveSync)** : permet à l'utilisateur de gérer les accès de ses propres appareils via la synchronisation EAS (Exchange ActiveSync)NB : aucune interface n'est à l'heure actuelle disponible dans la gestion des paramètres BlueMind de l'utilisateur, cette fonctionnalité permet des actions par script au moyen de la  clef API de l'utilisateur (voir [Paramètres utilisateur - chapitre 6 Clés d'API](/Guide_de_l_utilisateur/Paramètres_utilisateur/))
- **Gérer ses comptes externes** : permet de connecter un compte Nextcloud si celui-ci est installé sur le domaine afin de remplacer le stockage des pièces jointes volumineuses intégré à BlueMind par le stockage Nextcloud de l'utilisateur. (voir [Fichiers volumineux et détachement des pièces jointes](/Guide_de_l_utilisateur/La_messagerie/Fichiers_volumineux_et_détachement_des_pièces_jointes/))


** **Messagerie** **

- **Gérer ses filtres de messagerie** : permet à l'utilisateur de gérer ses filtres personnels de messagerie
- **Gérer ses identités de messagerie** : permet à l'utilisateur de créer et paramétrer ses identités de messagerie à partir de son adresse principale, d'un alias, ou d'une boîte partagée
- **Identité externe** : permet à l'utilisateur de se créer des identités avec pour émetteur une adresse externe au domaine
- **Transfert de messages** : permet de transférer automatiquement tous les messages reçus vers une autre adresse de messagerie, interne ou externe.Lorsque ce rôle est désactivé, l'utilisateur ne peut pas activer le transfert global de sa messagerie (en interne comme en externe) ET il ne peut pas activer de filtre de messagerie avec transfert vers une adresse externe.


**Cloud**

- **Drive** : possibilité de retrouver et envoyer de nouveau des pièces jointes précédemment détachées par l'utilisateur et stockées sur le serveur
- **Pièces jointes détachées** : possibilité de [détacher les pièces jointes](https://forge.bluemind.net/confluence/display/DA/.Fichiers+volumineux+et+detachement+des+pieces+jointes+vBM-3.5) des messages afin de les présenter sous forme de lien de téléchargement aux destinataires


Pour en savoir plus sur la gestion de ces droits, consultez les pages dédiées à la [gestion des utilisateurs](/Guide_de_l_administrateur/Gestion_des_entites/Utilisateurs/) et à [L'administration déléguée](/Guide_de_l_administrateur/Gestion_des_entites/Utilisateurs/L_administration_déléguée/)

