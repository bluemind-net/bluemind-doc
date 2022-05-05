---
title: "Gérer les réservations de ressources"
confluence_id: 86762893
position: 86
---
# Gérer les réservations de ressources


Les ressources sont les **moyens de l'organisation** (véhicules, salles de réunions, etc.) mis à disposition des utilisateurs.

Chaque ressource a son propre calendrier afin de permettre aux utilisateurs de la réserver. 
Ce calendrier est [partagé](https://forge.bluemind.net/confluence/display/DA/.Partager+un+calendrier+vBM-4#id-.PartageruncalendriervBM4-Partageruncalendriereninternepartageinterne) à un ou plusieurs utilisateurs avec des droits d'écriture pour gérer les réservations. Ces utilisateurs sont appelés **gestionnaires de ressources**. 
En fonction du paramétrage de la gestion des réservations, leur rôle va du simple suivi à la validation des demandes.


:::info

Pour suivre les réservations d'une ressource, le gestionnaire doit **[afficher son calendrier dans son agenda](/STAGING/Guide_de_l_utilisateur_4.7/L_agenda_4.7/Afficher_plusieurs_calendriers/)**

:::


****Cas n°1** : La gestion des réservations en entièrement automatique**

- Le système accepte ou refuse la demande automatiquement en fonction des disponibilités
- L’utilisateur et le gestionnaire reçoivent la notification de validation ou de refus par e-mail
- **Le gestionnaire ****n'a pas d'action à réaliser******
- L'évènement apparait dans le calendrier de la ressource comme "validé"ou "peut-être" ou "refusé" (si l'option "Afficher les évènements refusés" est activée dans les [paramètres de l'agenda](/STAGING/Guide_de_l_utilisateur_4.7/L_agenda_4.7/Paramétrer_l_agenda/))


![](../../../attachments/86762893/86764790.png)


****Cas n°2** : La gestion des réservations n'est pas automatique**

- Le gestionnaire reçoit la demande de réservation par e-mail et la notification s'ajoute dans la barre d'action de l'agenda
- L'évènement apparait dans le calendrier de la ressource.
- **Le gestionnaire doit**, en fonction de la disponibilité constatée sur le calendrier de la ressource, **accepter, mettre en attente, refuser la demande ou proposer un nouvel horaire**
- L'utilisateur reçoit la notification de validation ou de refus par e-mail


**![](../../../attachments/86762893/86764789.png)**


:::info

Afin d'éviter le surbooking, dès qu'un utilisateur réserve une ressource, celle-ci passe en statut "en attente" et apparait comme "indisponible" pour les autres utilisateurs. Cependant, la réservation reste possible. Dans ce cas, le gestionnaire de la ressource recevra toutes les demandes de réservation et verra apparaitre tous les évènements sur le calendrier de la ressource. Il devra alors gérer les attributions.

:::


****Cas n°3** : La gestion des réservations est partiellement automatique** : seules les acceptations sont automatiques

- **Si la ressource est disponible** = cas n°1****
    - Le système accepte automatiquement la demande
    - L’utilisateur et le gestionnaire reçoivent la notification de validation par e-mail
    - **Le gestionnaire ****n'a pas d'action à réaliser******
    - L'évènement apparait dans le calendrier de la ressource comme "validé"
- **Si la ressource n'est pas disponible** = cas n°2
    - Le gestionnaire reçoit la demande de réservation par e-mail et la notification s'ajoute dans la barre d'action de l'agenda
    - L'évènement apparait dans le calendrier de la ressource avec le statut "en attente"
    - **Le gestionnaire doit** **accepter, mettre en attente, refuser la demande ou proposer un nouvel horaire**
    - L'utilisateur reçoit la notification de validation ou de refus par e-mail


