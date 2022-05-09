---
title: "Procédure de départ utilisateur et redirection de ses mails"
confluence_id: 57771508
sidebar_position: 60
---
# Procédure de départ utilisateur et redirection de ses mails


## Présentation

Lors du départ d'un collaborateur, il peut vous être demandé de récupérer ses données avant de supprimer le compte de l'utilisateur. Dans certaines organisations, il est aussi souhaitable que les mails qui lui sont destinés continuent d'être reçus par l'organisation.

Cette procédure décrit ces opérations permettant à la fois :

- de suspendre l'utilisateur (afin de bloquer son accès sans supprimer les données)
- de sauvegarder et archiver les données
- de transférer les nouveaux mails reçus vers une autre boite aux lettres.


Dans cet exemple :

- l'utilisateur à suspendre a pour adresse [user1@bm.com](mailto:user1@bm.com)
- l'utilisateur destinataire des mails pour user1 est [ userCS@bm.com ](mailto:userCS@bm.com)


## Solution avec transfert d'emails

Afin de récupérer les nouveaux emails destinés au collaborateur ayant quitté l'organisation, deux solutions sont possibles :

- transférer les messages vers un autre utilisateur : on ajoute les adresses emails de l'utilisateur parti ([ user1@bm.com](mailto:user1@bm.com) dans notre exemple) en tant qu'alias de l'utilisateur cible
- transférer les messages vers une boite partagé : on crée une boite partagée avec l'adresse de l'utilisateur parti (user1@bm.com) ou un alias correspondant à celle-ci.


Pour cela :

1. Renommer l'utilisateur en user1.bck
2. Positionner un alias vers user1.bck de l'adresse user1 2'. OU : créer une éventuelle boite partagée bp.userbck
3. Rediriger (avec ou sans copie locale) les mails de user1.bck vers userCS
4. Attendre la prochaine sauvegarde globale.
5. Récupération des emails - 3 possibilités :
    1. Utiliser un client lourd type Thunderbird pour copier l'intégralité des messages vers la bal partagée bp.userbck
    2. Utiliser un client lourd type Thunderbird pour récupérer en POP l'intégralité des messages
    3. Utiliser le script de [Restauration du contenu d'une boîte utilisateur ou partagée](/Base_de_connaissance/Restauration_du_contenu_d_une_boîte_utilisateur_ou_partagée/) vers l'utilisateur ou la boîte partagée cible
6. Récupération des contacts et de l'agenda
    1. En console d'admin, accéder au menu "Arborescence DataProtect"
    2. Cliquer sur la dernière sauvegarde
    3. Sélectionner l'utilisateur user1.bck
    4. Cliquer sur les liens permettant de récupérer les fichiers VCard (carnets d'adresses) et le fichier ICS (données d'agenda).
7. Supprimer l'utilisateur user1.bck
8. Créer un alias user1 pour l'utilisateur userCS


## Solution avec réponse automatique

Il est parfois préférable de ne pas vouloir transférer tous les nouveaux messages d'un collaborateur à un autre pour des raisons de confidentialités et de vouloir envoyer un retour à l'expéditeur pour lui demander de contacter un autre collaborateur.

Dans ce cas deux solutions sont possibles :

- Créer un nouvel utilisateur user2.out en lui donnant en alias l'adresse email de l'utilisateur parti : user1@bm.com et mettre en place en message d'absence personnalisé. L'avantage de cette approche est de pouvoir mettre en place un message personnalisé pour chaque utilisateur, l'inconvénient est que **cet utilisateur sera décompté dans le nombre d'utilisateur pour la souscription**.
- Créer un seul utilisateur user.deactivated en lui donnant comme alias les adresses et alias de tous les collaborateurs qui ne sont plus présents puis mettre en place en message d'absence commun à tous les utilisateurs. Ainsi **un seul utilisateur** permet de gérer tous les utilisateurs qui ne sont plus présent.


## Suppression et synchronisation annuaire

Lorsqu'un utilisateur est supprimé dans l'AD/LDAP, il est alors automatiquement suspendu dans BlueMind lors de la synchronisation.

Sa suppression dans l'annuaire AD/LDAP peut donc se faire à n'importe quel moment du processus. Elle entraînera la désactivation de l'utilisateur dans BlueMind et empêchera la connexion de celui-ci mais ne supprimera pas ses données.

On peut donc suivre les procédures ci-dessus puis supprimer l'utilisateur de l'annuaire ensuite.


