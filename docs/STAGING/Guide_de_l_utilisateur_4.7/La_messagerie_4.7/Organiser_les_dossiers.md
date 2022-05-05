---
title: "Organiser les dossiers"
confluence_id: 86762556
position: 70
---
# Organiser les dossiers


La colonne de gauche présente la liste hiérarchique des dossiers accessibles par l'utilisateur, en lecture ou en lecture-écriture, triés en 2 arborescences repliables :

1. **Le compte de l'utilisateur** regroupe ses dossiers propres : dossiers par défaut (boîte de réception, messages envoyés, corbeille, etc.) suivis des dossiers créés par l'utilisateur triés par ordre alphabétique
2. **Dossiers partagés** : regroupe les boîtes partagées sur lesquelles l'utilisateur a un droit de lecture ou d'écriture.


Lorsqu'un dossier est sélectionné :

- les messages qu'il contient s'affichent dans la colonne du milieu
- le nom du dossier apparait sur fond bleu
- la puce indiquant le nombre de messages non lus dans le dossier apparait en bleu vif :


![](../../../attachments/86762556/86764485.png) 
*Ici le dossier "restored-2021-01-14" est sélectionné*

## Créer un dossier

- En bas de l'arborescence de l'utilisateur, se trouve une entrée "**Nouveau dossier**" :![](../../../attachments/86762556/86764484.png)
- Cliquer dessus pour faire apparaître le champs de saisie :![](../../../attachments/86762556/86764483.png) 
    - Pour valider la création : appuyer sur &lt;Entrée>
    - Pour annuler la création : appuyer sur &lt;Echap> ou cliquer sur la croix en fin de ligne


## Gérer les dossiers

En passant la souris sur un dossier, un menu apparait, proposant les **actions possibles** sur ce dossier et les messages qu'il contient :

![](../../../attachments/86762556/86764482.png)


Les actions actuellement disponibles sont :

- **Créer un sous-dossier**
- **Renommer le dossier**
- **Supprimer le dossier**
- **Marquer tout comme lu** : tous les messages du dossier sont marqués comme lus
- **Vider le dossier** : les messages contenus dans le dossier seront supprimés définitivement. Ils ne seront pas placés dans la corbeille.


:::info
La suppression d'un dossier et de son contenu est une suppression définitive : les messages contenus dans le dossier ne sont pas placés à la corbeille.
:::


## Déplacer un dossier

Cette fonctionnalité n'est pas encore disponible dans la version test du webmail.

Pour contourner cela, il faut procéder à un déplacement des messages qu'il contient :

- Créer le dossier de destination à l'endroit souhaité
- Se rendre dans le dossier source
- Sélectionner l'ensemble des messages (bouton "Tous" en haut de liste)
- Déplacer les messages en les faisant glisser dans le nouveau dossier (voir ci-après)


## Vider la corbeille

Afin d'éviter de surcharger l'espace de stockage, il est possible de vider automatiquement la corbeille à chaque déconnexion en allant dans les paramètres de la messagerie : **Préférences - Messagerie - Général - Lors de la déconnexion** et activer l'option "**Vider la corbeille**"

![](../../../attachments/86762556/86764481.png)

## Afficher la capacité de stockage

Afin de gérer au mieux son espace de stockage, il est possible d'afficher la proportion d'espace utilisé et d'espace libre.

Pour cela, aller dans les paramètres de la messagerie : **Préférences - Messagerie - Général - Capacité de stockage** et sélection l'option "**Toujours afficher la capacité de stockage**"

![](../../../attachments/86762556/86764480.png)


:::info

** **À propos des quotas** **

Lorsque le quota est activé, son pourcentage d'utilisation est affiché en permanence en bas du panneau de gauche de la messagerie webmail, le survol avec la souris permet d'afficher les informations détaillées :
![](../../../attachments/86762556/86764490.png) ![](../../../attachments/86762556/86764489.png)

Des codes couleurs permettent de visualiser le niveau du quota : le taux d'occupation est affiché en orange s'il atteint 75% du quota, en rouge foncé s'il atteint 85% et en rouge s'il atteint 100% :

![](../../../attachments/86762556/86764488.png)

Lorsqu'un quota est atteint, il bloque la réception de mails. Ces mails sont conservés par le serveur pendant quelques jours.
Les opérations d'envoi et même de suppression peuvent aussi être perturbées, le système ayant besoin d'effectuer des copies dans un répertoire temporaire et/ou dans la corbeille.


:::info

Quota et suppression

Pour supprimer des messages lorsque le quota est atteint, utilisez la fonction de suppression définitive (sans passer par la corbeille) en cliquant sur &lt;SHIFT+Suppr>.

:::

Un quota atteint peut être manuellement augmenté par l'administrateur, puis redescendu à tout moment vers le quota initial.

:::

