---
title: "L'agenda"
confluence_id: 57770444
position: 40
---
# L'agenda


## Présentation

BlueMind intègre un agenda partagé complet, proposant de nombreuses fonctionnalités parmi lesquelles :

- vues jour, semaine, mois et liste
- vues multi-agendas, multi-utilisateurs, groupes
- agendas de ressources
- gestion des vues de type bookmarks
- recherche de créneaux disponibles
- recherche full-text
- gestion de droits et délégations
- synchronisation avec Outlook
- intégration dans Thunderbird
- gestion de la mobilité sur smartphones et tablettes (iphone, ipad, Android, Blackberry)
- synchronisation de calendriers externes
- partage de calendrier vers l'externe
- impressions des agendas
- gestion des récurrences, exceptions, rdv privés,..


![](../../attachments/57770444/72188625.png)

## Affichage et navigation

### La vue principale

La vue principale par défaut de l'agenda BlueMind se compose de plusieurs parties :

- ![](../../attachments/57769989/69896475.png) : la barre des tâches, permettant de passer d'une application à l'autre
- ![](../../attachments/57769989/69896474.png) : Le calendrier permet de rechercher et se rendre à une date : faire défiler les mois avec les flèches « et » puis cliquer sur la date. Dans la zone principale s'affiche alors la période comprenant la date sélectionnée (jour, semaine, mois, selon le paramétrage en cours).
- ![](../../attachments/57769989/69896473.png) : la liste des calendriers actuellement affichés, ainsi que l'accès aux vues et étiquettes
- ![](../../attachments/57769989/69896472.png) : le moteur de recherche permet de rechercher des événements par nom, étiquettes, détails, participant, etc.
- ![](../../attachments/57769989/69896471.png) : l'affichage principal de l'agenda de l'utilisateur ainsi que les agendas auxquels il est abonné et/ou d'autres agendas de son choix (utilisateurs, ressources)
    - Les boutons en haut à gauche de la zone principale permettent de ramener à la période incluant la date du jour et naviguer vers des dates précédentes ou suivantes.
    - Les boutons en haut à droite permettent de choisir la période ou le type d'affichage : jour, semaine, mois, liste (cette dernière affiche la liste des événements seulement) ainsi que d'accéder aux fonctions d'**impression** et d'**import/export ics**. Le menu des outils permet aussi de rafraîchir la vue en cours :![](../../attachments/57770444/72188600.png)
- ![](../../attachments/57769989/69896470.png) : le panneau de visualisation des tâches peut être affiché ou masqué grâce au bouton ||| situé en haut à droite


Des icônes sur les événements permettent de voir d'un seul coup d’œil les propriétés de l'événement :

- ![](../../attachments/57770444/72188583.png) il y a plusieurs participants
- ![](../../attachments/57770444/72188581.png) l'événement est privé
- ![](../../attachments/57770444/72188580.png) l'événement est récurrent


### Afficher des agendas

La liste des agendas affichés est visible à gauche de la page, en ![](../../attachments/57770444/72188578.png)

- Pour **ajouter** un agenda, taper son nom dans le champs de saisie et choisir l'agenda proposé par l'autocomplétion :![](../../attachments/57770444/72188577.png)
- Pour **masquer** temporairement un agenda, cliquer sur son nom dans la liste : le nom devient grisé et les événements disparaissent de la vue :![](../../attachments/57770444/72188576.png)
- Pour **retirer** un agenda cliquer sur l'icône de couleur en face de son nom puis cliquer sur "Remove" dans le menu de personnalisation proposé :![](../../attachments/57770444/72188615.png)


## Modèle de gestion des réunions

**En version 4.2**, le modèle et les interfaces sont encore améliorés. BlueMind élimine le risque d'erreur et de décalage entre collaborateurs en clarifiant les libellés et options de notifications. La gestion des événements récurrents est elle aussi enrichie : le choix du type de modification sur une série (modifier un événement, toute la série ou la suite de série) est généralisé à l'ensemble des actions réalisées dans la vue d'agenda.

### Gestion personnalisée

Chaque participant a dans son calendrier sa propre version d'une même réunion. Ainsi il peut y apporter des modifications personnelles (lieu, catégorie, note, etc.) ou encore indiquer une **participation différenciée** aux occurrences d'une série de réunions : il peut accepter la totalité de la série mais indiquer qu'il ne participera pas à une ou plusieurs de ses occurrences, par exemple.

### Organisation et participation


:::info

Afin de pouvoir gérer au mieux une réunion, **l'organisateur est désormais obligatoirement participant de ses événements et des réunions qu'il organise**.

Pour déléguer une réunion ou un événement, c'est-à-dire la créer directement sur un agenda (utilisateur, ressource ou calendrier partagé), le créateur de celle-ci doit donc

1. **avoir le droit d'écriture** ("peut modifier") sur l'agenda souhaité
2. **l'afficher dans sa vue**
3. **désigner celui-ci comme organisateur**


:::

Ainsi, si John Doe veut créer un rendez-vous dans l'agenda de John Smith :

- l'utilisateur Smith donne le droit "Peut modifier mes rendez-vous" à l'utilisateur Doe
- Doe affiche dans sa vue l'agenda de Smith
- Doe crée un rendez-vous en sélectionnant Smith
    - dans la liste déroulante "Agenda" pour la création rapide :![](../../attachments/57770444/72188590.png) NB : la couleur de l'événement est aussitôt modifiée et prend la couleur des événements de J. Smith
    - dans la liste déroulante "Organisateur" pour le formulaire complet :![](../../attachments/57770444/72188588.png)


### Invitations et notifications

#### Envoi des notifications

Les informations transitent par email, les notifications sont donc nécessaires pour informer, que ce soit l'organisateur pour informer les participants ou les participants pour informer l'organisateur de leur réponse ou changement de statut.

**À partir de BlueMind 4.2**, les interfaces sont éclaircies et simplifiées, éliminant les risques de confusion ou de décalage entre les agendas organisateurs et participants. Les organisateurs ont désormais des boutons clairs leur permettant de choisir entre envoyer ou enregistrer en tant que brouillon. Ils ont aussi la possibilité de choisir de notifier l'ensemble des participants ou non lors de l'ajout ou de la suppression d'un invité. **Les participants n'ont quant à eux plus la possibilité de se déclarer présent (ou non) sans envoyer de réponse à l'organisateur.**


:::tip

Modification et Notification

Les ajouts/suppressions/modifications des tags et des rappels sont considérés comme des changements privés qui ne sont pas envoyés aux participants. Toute autre modification génère un envoi des informations mises à jour aux participants.

:::

Pour en savoir plus, consultez la section dédiée à [L'agenda](/Guide_de_l_utilisateur/L_agenda/).
Nous attirons votre attention en particulier sur les pages concernant [Les événements](/Guide_de_l_utilisateur/L_agenda/Les_événements/) et [l'organisation des réunions](/Guide_de_l_utilisateur/L_agenda/Organiser_une_réunion/).


:::info

Versions antérieures à 4.2

Lors de la création d'une réunion, **si l'organisateur choisit de ne pas envoyer les invitations alors les participants** ne sont pas notifiés par message et **ne voient pas apparaître la réunion dans leur agenda**.

De même, lors de l'acceptation ou du refus de participation à une réunion, les notifications sont reçues seulement par l'organisateur de la réunion qui centralise les informations.


:::info

Si le participant choisit de ne pas envoyer de notification à l'organisateur, c'est sa version uniquement qui sera modifiée : l'organisateur ne verra pas son statut dans son agenda.

:::

:::

#### Consultation du statut de participation

La remontée des informations ne s'effectuant de la part des participants que vers l'organisateur, **un autre participant voit dans sa version de la réunion les statuts des autres participants **au moment où l'organisateur a envoyé la dernière version**** (envoi de l'invitation ou d'une modification). Pour s'assurer de voir les statuts à jour, il faut consulter la version de la réunion **dans l'agenda de l'organisateur** (si celui-ci lui a donné le droit de lecture sur son agenda) :


![](../../attachments/57770444/72188620.png)


Une même réunion consultée par l'utilisateur John Smith sur l'agenda de l'organisateur et sur le sien.


### Le cas des ressources

Les ressources fonctionnent comme des utilisateurs.

Ainsi, de même que dans le cas général, pour créer un événement directement dans l'agenda de la ressource, l'utilisateur doit avoir le droit "Peut modifier ses événements" et positionner celle-ci en organisatrice.

Si l'utilisateur est pourvu d'un simple droit de réservation, il doit alors créer un événement dans son propre agenda et y inviter la ressource.

De plus, les fonctionnalités de réservation de ressources permettent, dans certains cas, une réservation automatique ou l'empêchement de doubles réservations. Retrouvez plus de détails sur la page consacrée aux [ressources](/Guide_de_l_utilisateur/Les_ressources/).

### Les calendriers de domaines

#### Le comportement

Les calendriers de domaines sont considérés comme des calendriers servant à l'information des utilisateurs, pour faire connaître par exemple les jours fériés, les jours de fermeture de l'entreprise, les événements commerciaux (salons, présentations...) ou municipaux (réunion du conseil, exposition, conseil d'école, etc.), les formations, les actions d'une équipe, etc.

 **Par conséquent, les calendriers de domaine ne peuvent pas être positionnés en organisateurs de réunions ni y être invités.** 

#### Bonnes pratiques

Les agendas de domaine peuvent être envisagés dans 2 cas :

- **l'agenda d'information**, via lequel les utilisateurs peuvent consulter des informations.![](../../attachments/57770444/72188586.png) **L'agenda de domaine est le bon moyen de gérer ce type de d'agenda.** Par exemple un agenda marketing contenant les salons auxquels l'équipe commerciale participe, ou encore un agenda de mairie informant des réunions publiques et événements organisés.
- **l'agenda opérationnel**, servant à créer des événements pour des utilisateurs.![](../../attachments/57770444/72188586.png) ** Il faut utiliser un agenda de [ressource](/Guide_de_l_utilisateur/Les_ressources/) pour permettre ce fonctionnement.** Par exemple sur un agenda des astreintes : on crée un événement hebdomadaire "astreinte week-end" et chaque semaine on y invite l'utilisateur concerné. Cela permet de centraliser l'information mais aussi aux utilisateurs d'accepter, refuser ou indiquer leur indisponibilité.


## Multi-Calendriers

L'agenda BlueMind permet à un utilisateur de créer et utiliser autant de calendriers personnels qu'il le souhaite et d'en [gérer les partages](/Guide_de_l_utilisateur/L_agenda/Préférences_de_l_agenda/) de la même façon que pour son calendrier par défaut.

![](../../attachments/57770444/72188579.png)

### Créer un nouveau calendrier

Pour créer un nouveau calendrier :

- se rendre dans la gestion des préférences > section Agenda > onglet « Mes Calendriers »
- dans le formulaire « Nouveau Calendrier » en haut de page, choisir un type de calendrier "simple" et lui attribuer un nom :![](../../attachments/57770444/72188598.png)
- cliquer sur « Ajouter », le calendrier apparaît aussitôt dans la liste des calendriers de l'utilisateur :![](../../attachments/57770444/72188596.png)


### Éditer

Pour modifier le nom d'un calendrier :

- se rendre dans la gestion des préférences > section Agenda > onglet « Mes Calendriers »
- dans la section "Calendriers", cliquer sur le nom du calendrier pour faire apparaître le champs de modification et les boutons d'action :![](../../attachments/57770444/72188594.png)
- Entrer le nouveau nom et 
    - valider avec la touche entrée ou en cliquant sur la coche en fin de champs
    - annuler en cliquant sur la croix en fin de champs


### Supprimer

Pour supprimer un calendrier :

- se rendre dans la gestion des préférences > section Agenda > onglet « Mes Calendriers »
- dans la section "Calendriers", cliquer sur l'icône "poubelle" ![](../../attachments/57769989/69896481.png) en fin de ligne


:::info

Le calendrier par défaut de l'utilisateur ne peut être supprimé

:::

### Partage des disponibilités

Dans la gestion des préférences des calendriers (voir ci-dessus), la colonne "Disponibilités" permet à l'utilisateur de choisir quel(s) calendrier(s) sera utilisé afin d'indiquer son statut lors de la recherche de disponibilités par d'autres utilisateurs souhaitant l'inviter à un événement.


:::info

Le partage de la disponibilité du calendrier par défaut ne peut pas être désactivée. Pour cette raison, la case à cochée est grisée et ne peut pas être décochée.

:::

Une fois les calendriers sélectionnés, remplir le formulaire de gestion des partages :

- soit en activant le partage public afin de rendre les disponibilités visibles par tous les utilisateurs du domaine
- soit par le partage individuel afin de partager son statut avec des utilisateurs ou groupes spécifiques


![](../../attachments/57770444/72188592.png)

Les types de partages possibles sont :

- Peut voir mes disponibilités
- Peut gérer les partages de mes disponibilités


## Impression

Pour imprimer la vue en cours, ouvrir le menu Outils situé en haut à droite de la zone d'affichage principale :

![](../../attachments/57770444/72188610.png)

La boite de dialogue d'impression propose alors l'impression de la vue en cours, sous forme de calendrier ou de liste, les options d'impression permettant de visualiser directement en aperçu la sélection :

![](../../attachments/57770444/72188608.png)

La vue semaine telle que présentée a pour résultat le fichier PDF suivant : [calendarSemaine.pdf](../../attachments/57770444/72188584.pdf)

![](../../attachments/57770444/72188606.png)

La vue liste telle que présentée aura pour résultat le fichier PDF suivant : [calendarListe.pdf](../../attachments/57770444/72188585.pdf)

Cliquer sur «Enregistrer» pour télécharger le fichier.


:::tip

- La liste déroulante permet de forcer l'orientation de l'impression en portrait ou paysage, par défaut le mode automatique est sélectionné et s'adapte au contenu à imprimer
- La case "Noir et blanc" permet une impression en niveaux de gris : les différents agendas auront des niveaux de gris différents afin d'améliorer la lisibilité et permettre de distinguer les événements
- Dans la vue "liste", une case supplémentaire permet d'inclure les détails des événements dans l'impression.


:::

## Export et import ICS

L'export et l'import ICS se font au moyen du menu Outils situé en haut à droite de la zone principale :

![](../../attachments/57770444/72188610.png)

### Export ICS

La boite de dialogue qui s'ouvre permet de sélectionner les événements à exporter. En cliquant sur «Exporter» le fichier ICS correspondant est proposé au téléchargement ou à l'ouverture selon la configuration de l'environnement de l'utilisateur :

![](../../attachments/57770444/72188604.png)

### Import ICS

La boite de dialogue qui s'ouvre permet de rechercher un fichier sur l'ordinateur puis sélectionner l'agenda dans lequel importer les événements qui s'y trouvent. Tous les agendas auxquels l'utilisateur a accès en écriture sont proposés :

![](../../attachments/57770444/72188602.png)

## Synchronisation ICS

Voir [Les calendriers externes](/Guide_de_l_utilisateur/L_agenda/Les_calendriers_externes/)


