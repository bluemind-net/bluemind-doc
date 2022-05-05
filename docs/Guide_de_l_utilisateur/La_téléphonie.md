---
title: "La téléphonie"
confluence_id: 57770666
position: 44
---
# La téléphonie


## Présentation

Grâce à son interconnexion avec [XIVO](https://www.xivo.solutions/) et [Wazo](https://wazo.io), BlueMind devient une solution de messagerie collaborative unifiée complète permettant de :

- recevoir ses messages vocaux dans sa boite mail
- signaler sa présence en ligne et sa disponibilité téléphonique
- visualiser la présence et la disponibilité de ses collaborateurs
- effectuer des renvois d'appels en fonction de son statut de présence
- synchroniser automatiquement son statut de présence avec ses rendez-vous d'agenda
- lancer des appels depuis l'interface web
- accéder à une seule et même base de contacts complète


## Émettre un appel

L'interface BlueMind permet d'émettre des appels de 3 façons différentes :

- depuis le numéroteur, disponible dans la barre de menu principale
- depuis l'application Contacts
- depuis un e-mail de message vocal


L'émission d'appel depuis une interface est communément désignée par le terme anglais «*Click to call*» (littéralement "cliquer pour appeler"). Le fonctionnement est le même dans tous les cas : lorsque l'utilisateur clique pour émettre un appel, son téléphone sonne, l'appel est émis lorsqu'il le décroche.

### Depuis le numéroteur

Présent dans la barre de menu principale, le numéroteur est disponible sur toutes les pages de l'interface de BlueMind. Il permet de lancer des appels en saisissant un numéro de téléphone ou, par autocomplétion, en recherchant un contact.

1. Cliquer sur le bouton ![](../attachments/57770060/57770066.png) de la barre de menu pour faire apparaître le numéroteur :![](../attachments/57770060/57770067.png)
2. Saisir (directement ou par copier/coller) le numéro de la personne à appeler ou son nom.
L'autocomplétion propose les personnes correspondantes au cours de la frappe :
![](../attachments/57770666/57770678.png)

3. Cliquer sur le bouton ![](../attachments/57770060/57770063.png) ou sur le numéro souhaité ou naviguer avec les flèches haut/bas du clavier et valider avec la touche entrée.


:::tip

XIVO effectue la recherche dans les annuaires suivants :

- Les [carnets d'adresses](https://forge.bluemind.net/confluence/display/LATEST/Gestion+des+carnets+d%27adresses) de l'utilisateur : carnets personnels et annuaire de l'entreprise
- L’annuaire AD/LDAP fédérateur entreprise interconnecté avec Bluemind


:::

### Depuis les contacts

Il est possible de lancer un appel directement depuis l'application Contacts de BlueMind :

- depuis la liste des contacts, en cliquant sur l'icône qui apparait au survol d'un contact :![](../attachments/57770666/57770676.png)
- depuis la fiche du contact, en cliquant sur l'icône en face de la ligne souhaitée :![](../attachments/57770666/57770674.png)


### Depuis la messagerie

Lorsqu'un message est laissé sur le répondeur vocal de l'utilisateur, celui-ci reçoit un message pour l'en informer. Il est alors possible de rappeler la personne depuis l'icône ![](../attachments/57770060/57770063.png) présente dans l'en-tête du message :

![](../attachments/57770666/57770672.png)

## Indicateur de présence

Dans la messagerie instantanée, la disponibilité téléphonique par une icône ![](../attachments/57769989/69896483.png) (téléphone) de couleur, devant la disponibilité en ligne de l'utilisateur :


![](../attachments/57770666/57770686.png)


Utilisateur hors ligne au téléphone mais disponible pour la messagerie instantanée

La disponibilité téléphonique peut être :

![](../attachments/57770666/57770680.png) Disponible

![](../attachments/57770666/57770681.png) En ligne mais occupé

![](../attachments/57770666/57770683.png) Hors ligne / Disponibilité inconnue

![](../attachments/57770666/57770684.png) (clignote du rouge au blanc) Téléphone en train de sonner

La disponibilité de la messagerie instantanée peut être :

![](../attachments/57770666/57770680.png) Disponible

![](../attachments/57770666/57770682.png) Occupé

![](../attachments/57770666/57770681.png) Absent

![](../attachments/57770666/57770683.png) Hors ligne

*Pour en savoir plus sur la disponibilité dans la messagerie instantanée et sa gestion, consulter la page dédiée * * [La messagerie instantanée](/Guide_de_l_utilisateur/La_messagerie_instantanée/) * *.*

## Statut et renvoi d'appel synchronisé

### Avec l'agenda

Il est possible de lier son statut de présence à l'agenda afin que le statut "occupé" apparaisse automatiquement lors des rendez-vous et/ou que les appels entrant soient renvoyés vers le répondeur vocal ou un numéro de téléphone.

Pour cela, se rendre dans la gestion des [Paramètres utilisateurs](/Guide_de_l_utilisateur/Paramètres_utilisateur/) > section Agenda > onglet Général puis :

- activer "Passer mon statut à Occupé" pour la messagerie instantanée
- activer le répondeur ou un transfert pour la téléphonie :


![](../attachments/57770666/57770670.png)

### Avec la messagerie instantanée

BlueMind permet de paramétrer un renvoi automatique vers le répondeur vocal ou vers un numéro lorsque le statut de messagerie instantanée est "Occupé".

Pour cela, se rendre dans la gestion des [Paramètres utilisateurs](/Guide_de_l_utilisateur/Paramètres_utilisateur/) > section Mon Compte > onglet Général et activer l'option souhaitée :

![](../attachments/57770666/57770668.png)


