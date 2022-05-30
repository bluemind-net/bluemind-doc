---
title: "Les composants et plugins"
confluence_id: 57771225
sidebar_position: 30
---
# Composants et plugins

## Les composants serveur

### Core

Le composant serveur Core est le web-service principal de BlueMind. Il permet de gérer :

- la logique métier
- les accès à la base de données
- les appels aux API BlueMind

### Application Server

Toutes les interfaces web à destination de l'utilisateur final sont exécutées sur un serveur web JEE. Les applications hébergées sont :

- l'agenda
- la gestion des contacts
- la console d'administration
- la gestion des paramètres
- l'Installation Wizard et le Setup Wizard
- l'application Apache Solr
- l'interface client du serveur XMPP (à partir de BlueMind v3)

### SMTP & IMAP

Les protocoles standards de messagerie sont supportés par BlueMind :

- SMTP grâce à postfix
- IMAP et POP with Cyrus IMAPd

### MQ Server

Hazelcast est packagé et entièrement intégré avec BlueMind pour l'échange d'événements entre applications BlueMind. Ce composant est utilisé pour :

- envoyer des notifications concernant les événements issus du calendrier (événements issus de Core et écoutés par EAS par exemple)
- envoyer des notifications concernant les événements issus de la gestion de contacts (événements issus de Core et écoutés par EAS par exemple)
- envoyer des notifications concernant les emails délivrés (événement issus du démon LMTP et écoutés par EAS par exemple)
- envoyer des notifications concernant les événements de login et de logout (événements issus de Core et écoutés par HPS par exemple)

Le cluster Hazelcast est constitué de 3 noeuds assurés par les services core, EAS et bm-webserver. Il est très important que le cluster soit complet pour le bon fonctionnement de BlueMind, son état peut être surveillé grâce au [Monitoring Bm-Tick](/Guide_de_l_administrateur/Supervision/Monitoring_Bm_Tick/).

### EAS

EAS est un serveur de synchronisation à destination des appareils mobiles (smartphones, tablettes, ...). Il gère les protocoles natifs de ce type d'appareils et permet donc d'utiliser les applications natives des smartphones pour synchronise les mails / agendas / contacts.

### Locator

Le composant Locator peut être considéré comme un serveur de résolution de nom interne à BlueMind. Il permet aux composants d'établir des liens entre eux.

Par exemple, Locator permet au composant EAS de connaître le nom du serveur IMAP qui possède la boîte mail d'un utilisateur donné.

### HPS

HPS est un serveur d'authentification HTTP de type Reverse proxy. Il se situe entre le reverse proxy [Nginx](http://wiki.nginx.org/Main) et les applications utilisateurs.

Quand une authentification est requise, HPS présente le formulaire de login à l'utilisateur si celui-ci n'est pas encore authentifié, ou passe la requête aux services demandés.

Ce composant est responsable de la logique SSO (Single Sign-On / Single Sign-Out) aux interfaces utilisateurs.

### SASL Daemon

Ce composant, nommé YSNP est le démon BlueMind d'authentification SASL. Il permet de valider les mots de passe auprès du composant Core et permet une authentification au niveau du composant IMAP pour les utilisateurs connectés via les interfaces web

## Les plugins

BlueMind peut être étendu au moyen d'*add-ons* (modules complémentaires) ou programmes complémentaires qui sont partagés par la communauté sur le [MarketPlace](https://marketplace.bluemind.net/).

Pour en savoir plus sur le développement de ces plugins, vous pouvez consulter la page dédiée [Contribuer à BlueMind](/Guide_du_développeur/Contribuer_à_BlueMind/).


