---
title: "Synchroniser les calendriers"
confluence_id: 86762901
sidebar_position: 130
---
# Synchroniser les calendriers

BlueMind permet une synchronisation différenciée pour chaque calendrier avec les logiciels clients (application web, clients lourds ou appareils mobiles).

La synchronisation des agendas s'effectue dans les [paramètres](/Guide_de_l_utilisateur/L_agenda/Paramétrer_l_agenda/) des contacts, en allant sur **Préférences - Agenda - Mes calendriers** ou **Autres calendriers**. Puis activer le bouton "**Synchronisation**" pour les calendriers souhaités.

![](../../attachments/86762901/86764797.png)

Lorsque la synchronisation est activée pour un calendrier, les données sont téléchargées sur le logiciel client. De ce fait :

|     | Synchronisation activée | Synchronisation désactivée |
| --- | ----------------------- | -------------------------- |
| Application web et Thunderbird | Le calendrier est consultable et disponible hors connexion | Le calendrier est consultable en mode connecté mais indisponible hors connexion |
| EAS iOS | Le calendrier est visible et disponible hors connexion. *Calendriers partagés* : dans BlueMind version 4, cela concerne uniquement les calendriers de l'utilisateur (par défaut et secondaires), les calendriers partagés ne seront pas affichés, qu'ils soient de domaine ou d'autres utilisateurs.| Le calendrier n'est pas visible |
| EAS (autres) | **Si cette fonctionnalité est activée par l'administrateur** (voir la page [Compatibilité](../../FAQ_Foire_aux_questions_/Compatibilité.md) pour plus de détails) : le calendrier est visible et disponible hors connexion. *Calendriers partagés* : dans BlueMind version 4, cela concerne uniquement les calendriers de l'utilisateur (par défaut et secondaires), les calendriers partagés ne seront pas affichés, qu'ils soient de domaine ou d'autres utilisateurs.| Le calendrier n'est pas visible|
| DAV | Le calendrier est visible et disponible hors connexion |
| Outlook (connecteur) | Le calendrier est visible et disponible hors connexion. Si un abonnement à un calendrier est ajouté dans Outlook, il est automatique ajouté dans BlueMind avec la synchronisation activée | Le calendrier n'est pas visible | 



:::info

Lorsque le volume des données contenues dans un calendrier est important (plus de 9000 entrées), un message avertit de possibles problèmes de synchronisation.

:::

