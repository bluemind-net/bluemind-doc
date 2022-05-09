---
title: "Les ressources"
confluence_id: 57770793
sidebar_position: 52
---
# Les ressources


## Présentation

Blue Mind permet de gérer, de même que les agendas individuels ou de groupes, les agendas de ressources (véhicules, salles, vidéo-projecteurs...).

L'administrateur peut définir de nouveaux types de ressources et déléguer la gestion des ressources à des utilisateurs.

Comme pour les agendas de personnes, la fonctionnalité disponible/occupé permet la recherche de disponibilités de ressources.


## Les droits de partage

Les droits que les utilisateurs peuvent se voir attribuer sur une ressource sont les suivants :

1. **Peut réserver la ressource** : l'utilisateur peut associer la ressource à un rendez-vous afin de demander à la réserver
2. **Peut réserver la ressource et visualiser ses réservations** : en plus du droit précédent, l'utilisateur peut consulter l'agenda de la ressource et voir ainsi ses réservations et demandes en cours
3. **Peut modifier ses réservations** : en plus des droits précédents, l'utilisateur peut modifier les réservations de la ressource (accepter, refuser, modifier, déplacer, supprimer, etc.). L'utilisateur est alors appelé **gestionnaire de la ressource**.
4. **Peut modifier ses réservations et gérer ses partages** : en plus des droits précédents, le gestionnaire de la ressource peut modifier les droits de partage de celles-ci et les attribuer aux autres utilisateurs.


## Réservation d'une ressource

La réservation d'une ressource se fait en plusieurs étapes :

1. L'utilisateur souhaitant réserver la ressource ajoute celle-ci aux participants de son événement lors de la création ou de l'édition de celui-ci.Pour cela il peut utiliser la recherche de disponibilités comme pour les autres participants :![](../../attachments/57770793/57770801.png)
2. Lorsque l'utilisateur enregistre son événement, il a le choix d'envoyer ou non une invitation, il s'agit d'un email de demande de réservation.
3. Le ou les gestionnaire désignés de la ressource reçoivent alors une demande par alerte d'agenda si le calendrier de la ressource est actuellement affiché dans leur application ** **et** ** par mail si une invitation a été envoyée.


![](../../attachments/57770793/57770799.png)

Le gestionaire peut accepter la demande depuis le mail de réservation


![](../../attachments/57770793/57770797.png)

La ressource est vue en attente de validation par le gestionnaire


4. 2 cas sont possible selon la [politique de réservation](/Guide_de_l_administrateur/Gestion_des_entités/Ressources/#Administrationdesressources-surbooking) choisie pour la ressource :
    1. Si l'acceptation et le refus automatiques sont activés, alors :
        - le gestionnaire reçoit un message de réservation de la ressource
        - si la ressource est disponible, sa participation est validée
        - si la ressource n'est pas disponible, sa participation est refusée
        - l'utilisateur reçoit un message d'acceptation ou de refus de la part de la ressource
    2. Si l'acceptation et le refus automatiques ne sont pas activés, le gestionnaire doit valider la demande de réservation d'une des différentes manières possible :
        - depuis sa messagerie, par les liens "Participation" de l'email reçu
        - depuis son agenda, par la liste des événements en attente (clic sur l'icône chiffrée du bandeau de navigation)
        - depuis son agenda en cliquant sur l'événement :![](../../attachments/57770793/57770795.png)


:::tip

si seule l'acceptation automatique est activée et que la ressource n'est pas disponible, alors c'est le cas b qui est appliqué : le gestionnaire de ressource reçoit un message de demande de réservation et le statut de la ressource reste en attente.

:::
5. L'utilisateur est alors informé par mail que la ressource a accepté ou refusé l'invitation.


:::info

Le processus de réservation est le même pour le gestionnaire de ressource qui souhaite la réserver lui-même : l'acceptation n'est pas automatique, il doit valider la participation de la ressource une fois le rendez-vous créé.
En revanche, il ne reçoit pas de message de demande de réservation, seuls les autres administrateurs de la ressource, s'il y en a, le reçoivent.

:::


