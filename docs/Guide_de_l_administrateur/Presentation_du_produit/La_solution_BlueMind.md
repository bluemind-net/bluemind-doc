---
title: "La solution BlueMind"
confluence_id: 57771222
sidebar_position: 10
---

# La solution BlueMind

BlueMind est 100% Web.

Toutes les fonctionnalités de BlueMind sont conçues pour et disponibles via un navigateur Web. Ainsi, l'ensemble des fonctionnalités est accessible au moyen d'un simple navigateur Web. L'utilisation de clients de messagerie n'est donc plus nécessaire et les déploiements sont grandement facilités.

BlueMind supporte en particulier les navigateurs :

- Mozilla à partir de la version ESR 52
- Chrome : dernière version
- Internet Explorer à partir de la version 11
- Safari à partir de la version 5.

![](./La_solution_BlueMind_attachments/57771223.png)

#### Interfaces utilisateurs Full JavaScript

BlueMind offre des ergonomies riches de type client lourd depuis de simples navigateurs :

- Pas de rechargement de page
- Mode web déconnecté dans le navigateur


#### File de messages (MOM)

BlueMind utilise des files de messages afin de limiter le trafic superflu et centraliser certains traitements. C'est en particulier le cas pour :

- le push e-mail (les nouveaux mails sont poussés vers les appareils mobiles quand nécessaire, rendant inutile le trafic lié à la vérification des nouveaux messages),
- la réplication de sessions entre tous les serveurs BlueMind,
- la répartition de charge et la haute disponibilité.


#### SSO intégré

BlueMind intègre son propre SSO, ce qui permet de passer de façon transparente d'une application à l'autre. Ainsi, un utilisateur en mode Web, quel que soit le navigateur, s'authentifie au moment de l'accès à BlueMind. Une fois cette authentification validée, il peut accéder à l'ensemble des applications BlueMind (Messagerie, Agenda, Contacts, Console d'administation...) sans nécessiter de nouvelle authentification.

De plus, le SSO autorise le single logout, qui déconnecte l'utilisateur de l'ensemble des onglets ou fenêtres BlueMind lorsqu'il se déconnecte d'une fenêtre.

#### Environnement Microsoft

BlueMind permet d'éviter la ré-authentification dans le cas d'une utilisation dans un environnement Microsoft.

Ainsi, un utilisateur sous Windows utilisant Outlook qui s'authentifie auprès de l'Active Directory à l'ouverture de session a son authentification reprise au lancement d'Outlook. La connexion à BlueMind est donc transparente.
