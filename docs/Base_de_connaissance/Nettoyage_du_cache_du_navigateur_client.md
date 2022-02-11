---
title: "Nettoyage du cache du navigateur client"
confluence_id: 57771927
position: 64
---
# Nettoyage du cache du navigateur client


:::important

Cette opération est à réaliser dans le navigateur de l'utilisateur.

Elle peut donc être réalisée par l'utilisateur lui-même.

:::

# Présentation

Les applications clientes BlueMind telles que l'application de calendrier, de contact, sont enregistrées dans le cache du navigateur client pour permettre le lancement de l'application dans un mode *offline*.

Cette opération est réalisée par la fonctionnalité *appcache HTML* si présente dans le navigateur web. Ce cache est automatiquement rafraîchi, mais il peut éventuellement être corrompu par le navigateur et il peut être important de pouvoir nettoyer ce cache pour le forcer à télécharger une version récente des applications.


# Mozilla Firefox

- Aller dans les préférences de Firefox :
  - sous Windows : Outils > Options
  - sous Linux : Édition > Préférences
  - sous Mac OS : Firefox > Préférences
- Aller dans la section "Vie privée et Sécurité" et faire défiler jusqu'à "Cookies et données de sites"
- Cliquer sur le bouton "Gérer les données" : ![](../attachments/57771927/57771931.png)
- Rechercher et sélectionner le site souhaité et cliquer sur le bouton "Supprimer les sites sélectionnés" : ![](../attachments/57771927/57771930.png)


# Google Chrome

- Aller dans les paramètres de Google Chrome
- Cliquer sur *Afficher les paramètres avancés*


* ![](../attachments/57771927/57771943.png)  *

- Dans la section *Confidentialité*, cliquer sur le bouton *Paramètres de contenu... *
- Cliquer sur le bouton *Cookies et données de site... * * ![](../attachments/57771927/57771941.png) * *  *
- Sélectionner l'URL du serveur BlueMind dans la colonne *Site*
- Cliquer sur chaque étiquette *Cache de l'application*, puis sur le bouton * *Supprimer * *
* ![](../attachments/57771927/57771942.png) *


# Apple Safari

- Accéder aux préférences de Safari en naviguant dans le menu *Safari > Préférences*
- Cliquer sur la section * *Vie privée * *
![](../attachments/57771927/57771932.png)

- Cliquer sur le bouton *Détails*
- Sélectionner le domaine BlueMind du serveur concerné dans la liste et cliquer sur le bouton * *Supprimer * *
* ![](../attachments/57771927/57771933.png) *


# Microsoft Internet Explorer

Uniquement disponible à partir de Microsoft IE 10.

- Naviguer dans le menu *Outils > Sécurité > Supprimer l'historique de navigation* (ou effectuer la combinaison de touches *Ctrl + Shift + Del*)
![](../attachments/57771927/57771935.jpg)

- Cocher les cases *Fichiers temporaires* et *Cookies*
- Cliquer sur le bouton *Supprimer*


