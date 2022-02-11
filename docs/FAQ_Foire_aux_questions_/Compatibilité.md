---
title: "Compatibilité"
confluence_id: 57770212
position: 32
---
# Compatibilité


Vous trouverez sur cette page les informations de compatibilité de BlueMind avec les navigateurs, logiciels tiers et appareils mobiles. Nous recensons les dispositifs testés et validés ainsi que les problèmes connus sur certains appareils ou systèmes d'exploitations.

Si votre appareil ne figure pas sur cette page, n'hésitez pas à [nous contacter](http://www.blue-mind.net/nous-contacter/) pour nous en informer.


# Navigateurs

BlueMind supporte les versions minimum suivantes, mais **l'utilisation des dernières versions disponibles est toujours recommandée** :


   | Navigateur | Version minimum |
| --- | --- |
| Firefox | 52.0 ESR |
| Chrome | dernière version |
| Safari | 5 |
| Internet Explorer | 11 |
| Microsoft Edge | dernière version |


   | Limitations connues |
| --- |
| Windows XP | Il est impossible d'utiliser BlueMind depuis XP+IE8 ou XP+outlook.Un contournement est possible pour les versions BlueMind 3.0 [à partir de 3.0.20](https://forge.bluemind.net/confluence/display/BM30/Fin+du+support+de+XP) et il n'est pas supporté avec BlueMind 3.5 |
| Console d'administration | La console d'administration de BlueMind n'est supportée par aucune version d'Internet Explorer. |


# Thunderbird

BlueMind supporte les versions récentes de Thunderbird, notamment à partir de la version 57.0.

Il est toutefois conseillé de toujours effectuer les mises à jours disponibles afin de bénéficier des correctifs et fonctionnalité publiés par ses créateurs et contributeurs.

# Outlook
:::important

Cette section concerne l'utilisation d'Outlook en MAPI, donc sans connecteur.

:::

Quelle que soit la version, BlueMind n'est compatible qu'avec Outlook ** **pour Windows****, les versions d'Outlook pour MacOS ne sont pas supportées.


    | Version d'Outlook | 32 bits | 64bits |
| --- | --- | --- |
| Outlook 2007  *(et versions antérieures)*  |  |  |
| Outlook 2010 |   *(1)*  |   *(1)*  |
| Outlook 2013 *(2)*  |  |  |
| Outlook 2016 |  |  |


&lt;sup> &lt;em>(1) le fonctionnement avec Outlook 2010 peut dépendre de la version de BlueMind et du niveau de mise à jour du poste client - nous consulter pour plus de détails et une étude personnalisée&lt;br/>&lt;/em> &lt;/sup>

&lt;sup> &lt;em>(2) Home&amp;Business, Standard, Professionnal, Professionnal Plus&lt;/em> &lt;/sup>


   | Fonctionnalités d'Outlook non encore supportées à ce jour |
| --- |
| Mode hybride caché / en ligne | Compte configuré pour télécharger les éléments vieux d'un certain temps (ex: 1 mois).Les données récentes sont téléchargées et accédées en local alors que les données plus anciennes sont accédés en ligne directement.**Recommandation/Contournement :** Utiliser le mode *Hors Connexion* |
| Détachement des pièces jointes | Joindre à un email et détacher des fichiers sur un espace de partage de fichiers. |
| Rappel de messages | Annuler l'envoi d'un email et le supprimant de la file d'attente d'envoi du serveur ou en le supprimant ou remplaçant le corps du message par un message de notification si déjà délivré dans les BAL des utilisateurs. |
| Partage de dossier email | Partager un seul dossier de mail et pas toute sa BAL.**Recommandation/Contournement :**Demander à l'administrateur une boîte partagée entre les utilisateurs concernés |
| Proposition d'un nouvel horaire | **Cette fonctionnalité est supportée à partir de BlueMind 4.5**Permet de proposer à l'organisateur un nouvel horaire sur une demande de réunion.**Recommandation/Contournement :**Répondre par la négative à l'invitation en proposant un nouvel horaire dans la note jointe |
| Corbeille |
| Récupérer les éléments supprimés de ce dossier | **Cette fonctionnalité est supportée à partir de BlueMind 4.5**Les éléments vidés de la corbeille peuvent encore être récupérés du serveur (selon une politique de conservation).**Recommandation/Contournement :**S'adresser aux administrateurs pour une éventuelle restauration de sauvegarde |
| Restaurer un élément autre que email | Restauration d'un rendez-vous, contact, etc. placé dans la corbeille |
| Mode conversation | Cette fonctionnalité n'est pas encore implémentée dans la gestion de MAPI par BlueMind, Outlook ne présente donc pas les messages en arborescence par conversation.Cependant il peut arriver que certains messages soient triés ainsi selon le client tiers dont ils proviennent (Webmail ou Thunderbird par exemple). |


# Android

BlueMind fonctionne sur toutes les versions Android depuis la version 4.4.2 ou supérieure et **de préférence la dernière version mise à jour proposée par le constructeur ou l'opérateur mobile**.

Le protocole EAS utilisé est un standard, il est cependant possible, en raison des surcouches ajoutées par les constructeurs ou opérateurs, que certains téléphones connaissent des dysfonctionnements. Lorsque cela est porté à la connaissance de nos équipes et que nous sommes en mesure de tester le téléphone ayant des problèmes, nous réalisons un correctif et intégrons ce téléphone à la liste des téléphones supportés.

Les mobiles proposant une version Android *stock* sont à privilégier : il s'agit d'une version Android pure, sans surcouche constructeur ou opérateur ni applications supplémentaires préinstallées.

Voici la liste (non exhaustive) des téléphones testés et fonctionnels avec BlueMind :

- Samsung
  - Galaxy S4 (Android 4.2 à 5.0.1)
  - Galaxy S7 (Android 6.0.1, 7.0)
- LG
  - Nexus 5 (Android 4.0 à 4.4)
  - G4


   | Limitations connues |
| --- |
| Affichage multi-calendrier | Android ne permettant pas de visualiser les différents calendriers au moyen de couleurs différenciées, l'affichage des calendriers partagés n'est pas possible par défaut, seul l'agenda de l'utilisateur apparaît et est fonctionnel.Il est cependant possible d'activer la fonctionnalité afin de la coupler avec une application tiers : [Multi-calendrier sur les smartphones.](Multi-calendrier-sur-les-smartphones_57771926.html)**Attention** : cela ne concerne que les calendriers de l'utilisateur (calendrier par défaut et calendriers secondaires), les calendriers partagés (de domaine ou d'utilisateurs) ne seront pas visibles même après activation. |
| Pas de synchronisation du dossier Brouillons | La synchronisation des brouillons est disponible via ActiveSync depuis la version 16 du protocole. BlueMind implémentant la version 14, les brouillons ne peuvent pas encore être synchronisés. |
| Huawei | L'application de calendrier native de Huawei présente des problèmes, notamment des suppressions intempestives de rendez-vous. En attendant des corrections de la part de Huawei il est conseillé de ne pas l'utiliser et de lui préférer l'application de Calendrier Google, présente et fonctionnelle sur les appareils. |
| Tâches | La gestion des tâches n'est à l'heure actuelle disponible que sur les appareils Samsung, via l'application du constructeur (nommée SPlanner, Samsung Calendar ou Calendrier selon les appareils et la langue configurée) |


# Mac OS X

Les protocoles CarDav et CalDav ne sont actuellement validés qu'avec les clients Mac OS X **natifs** et, de préférence, avec un OS à jour. Au vu de la permissivité de la norme il ne nous est pas possible de certifier le bon fonctionnement avec d'autres clients utilisant ce protocole.

# iPhone, iPad

Les versions d'IPhone et iPad en version minimum 9.3.5 d'iOS ont été testées et sont supportées, sans limitation, mais il est toujours recommandé d'utiliser la dernière version disponible pour votre appareil.


   | Limitations connues |
| --- |
| Limitation de la synchronisation dans le temps | Pour des raisons de performances, la synchronisation des messages est limitée aux 30 derniers jours, même dans le cas où l'option "tout synchroniser" est sélectionnée sur l'appareil. |
| Pas de synchronisation du dossier Brouillons | La synchronisation des brouillons est disponible via ActiveSync depuis la version 16 du protocole. BlueMind implémentant la version 14, les brouillons ne peuvent pas encore être synchronisés. |


# Windows Phone

BlueMind fonctionne sur toutes les versions Windows Phone depuis la version 7.10 (Mango, septembre 2011).

Voici la liste des téléphones fonctionnels avec BlueMind :

- Nokia Lumia 520 (Lumia Black - Windows Phone 8.0)


   | Limitations connues |
| --- |
| Limitation de la synchronisation dans le temps | Pour des raisons de performances, la synchronisation des messages est limitée aux 30 derniers jours, même dans le cas où l'option "tout synchroniser" est sélectionnée sur l'appareil. |
| Pas de synchronisation du dossier Brouillons | La synchronisation des brouillons est disponible via ActiveSync depuis la version 16 du protocole. BlueMind implémentant la version 14, les brouillons ne peuvent pas encore être synchronisés. |


# Blackberry

BlueMind fonctionne sur toutes les versions Blackberry depuis la version 10 (début 2013).

Voici la liste des téléphones fonctionnels avec BlueMind :

- Blackberry Q5
- Blackberry Q10


   | Limitations connues |
| --- |
| Affichage multi-calendrier | Blackberry affectant la même adresse email pour tous les calendriers synchronisés, il est impossible à l'heure actuelle de procéder à la gestion de plusieurs calendriers. Les calendriers partagés n'apparaissent donc pas, seul l'agenda de l'utilisateur est affiché et fonctionnel. |
| Limitation de la synchronisation dans le temps | Pour des raisons de performances, la synchronisation des messages est limitée aux 30 derniers jours, même dans le cas où l'option "tout synchroniser" est sélectionnée sur l'appareil. |
| Pas de synchronisation du dossier Brouillons | La synchronisation des brouillons est disponible via ActiveSync depuis la version 16 du protocole. BlueMind implémentant la version 14, les brouillons ne peuvent pas encore être synchronisés. |


