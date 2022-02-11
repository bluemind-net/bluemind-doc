---
title: "Logs - Fichiers journaux"
confluence_id: 57771649
position: 52
---
# Logs - Fichiers journaux


# Présentation

BlueMind conserve des journaux pour chaque type d'application et d'utilisation.
:::important

Il est important de fournir l'espace disque suffisant afin de pouvoir stocker les journaux et leurs archives.

La saturation de cet espace bloque l'enregistrement des nouvelles informations dans les fichiers journaux et peut provoquer un ralentissement, voire un blocage des services.

:::


On distingue 3 types de fichiers journaux :

- les journaux systèmes, gérés par le mécanisme de gestion des journaux systèmes ([rsyslog](http://www.rsyslog.com/) + [logrotate](https://linux.die.net/man/8/logrotate))
- 
les journaux des services Java de BlueMind, gérés par [LogBack](https://logback.qos.ch/)
:::important

Heures des traces

Les traces générées par Java dans ces fichiers sont à l'heure GMT.

Ainsi, en France, sur le fuseau horaire Europe/Paris, les heures sont décalées d'1h en hiver et 2h en été. Pour rechercher des événements qui se sont produits à 15h il faudra rechercher :

  - à 14h de fin Octobre à fin Mars
  - à 13h de fin Mars à fin Octobre

:::
- les journaux internes à un service, gérés via la configuration de ce service


La durée de conservation dépend du paramétrage de ces mécanismes de gestion des journaux. Il est possible de modifier leur configuration pour obtenir la durée de rétention souhaitée.

# Les fichiers de logs

Les fichiers journaux se trouvent dans le dossier `/var/log` et ses sous-dossiers


      | Composant | Nom du paquet | Fichier de log | Type | Description |
| --- | --- | --- | --- | --- |
| BlueMind Core | bm-core | ./bm/ :* core.log
* mail-index.log
* slow-call.log

./bm/audit/ :* audit-calendar*.log
 | LogBack | Service principal de BlueMind :* gestion du contenu de la base de données, implémentation des règles métier
* indexation des mails lors de l’exécution des tâches de réindexation
* requêtes ayant pris plus de 200 ms à s’exécuter

Audit :* Trace les actions réalisées dans le calendrier indiqué dans le nom du fichier : audit-calendar:&lt;nom du calendrier>:&lt;uid de l'utilisateur>.log
 |
| Postfix | postfix | RedHat : ./maillogDebian/Ubuntu :* ./mail.err
* ./mail.info
* ./mail.log
* ./mail.warn
 | Système | Service de transfert des courriels [Postfix](http://postfix.org/) qui permet l'acheminement des emails vers la boîte ou le serveur des destinataires. |
| Cyrus | bm-cyrus-imapd | RedHat : ./maillogDebian/Ubuntu :* ./mail.err
* ./mail.info
* ./mail.log
* ./mail.warn
 | Système | Service de gestion des boîtes aux lettres [Cyrus IMAP](https://www.cyrusimap.org/). Permet de:* remettre un email dans la boîte correspondante et d'y accéder en IMAP et/ou POP.
* filtrer les emails lors de leur réception
* gérer le message d'absence
* gérer les redirections
 |
| Webmail | bm-webmail | ./bm-webmail :* errors
* sendmailmailSent.log
 | LogBack | * erreurs du service de webmail (RoundCube)
* tracent les emails envoyés ainsi que les règles analysées sur ces messages (alias, redirection, etc.)
 |
| Synchronisation EAS | bm-eas | ./bm-eas/eas.log | LogBack | Trace les opérations effectuées depuis et vers les appareils mobiles connectés en EAS.À noter que les logs pour chaque file de synchronisation sont stockés dans des fichiers séparés, afin de faciliter l'analyse de bugs ou d'un comportement inadéquat. |
| Transfert de courrier | bm-lmtpd | ./bm-lmtpd/lmtpd.log | LogBack | Service chargé de délivrer un email dans la boîte correspondante.Certaines opérations liées à BlueMind sont réalisées à ce niveau - l'analyse des invitations ICS par exemple. |
| Localisation | bm-locator | ./bm-locator/locator.log | LogBack | Localise les services associés à un utilisateur (serveur de boîte aux lettres, etc.) |
| Mapi | bm-mapi | ./mapi.log./activities.log | LogBack | Log général du service mapiLog d'activitéPour des informations plus détaillées, consultez la page dédiée aux [Résolution des problèmes avec Outlook](https://forge.bluemind.net/confluence/display/BM40/Resolution+des+problemes+avec+Outlook). |
| Replication |  | ./bm/replication.log | LogBack |  |
| Identification | bm-node | ./bm-node/node.log | LogBack | Service permettant au serveur BM-Core d'exécuter des opérations systèmes sur les nœuds de l'architecture BlueMind.Le fichier log trace les commandes exécutées. |
| BlueMind web server | bm-webserver | ./bm-webserver :* webserver.log
* dav.log
* js-errors.log
* setup.log
 | LogBack | Répertoire contenant les fichiers de logs générés par le service *webserver*.* synchronisations des calendriers et agendas.
* synchronisation via caldav/carddav
* erreurs JS sur les applications web
* mises à jour de BlueMind
 |
| Authentification | bm-hps | ./bm-hps/hps.log | LogBack | Trace les problèmes et réussites d'authentification et ouverture de session |
| Tika | bm-tika | ./bm-tika/tika.log | LogBack | Extraction des méta-données et données des documents permettant de renseigner l'index ES.Trace les erreurs d'extraction des informations à indexer. |
| PHP FPM | bm-php-fpm | ./bm-php-fpm :* bm-php-fpm.log
* slow.log
 | LogBack | Interpréteurs PHP.Le fichier `slow.log` contient les requêtes PHP ayant duré plus de 15s. |
| ElasticSearch | bm-elasticsearch | ./bm-elasticsearch | Interne | Logs du service ElasticSearch.Les fichiers `*_slowlog.log` contiennent les requêtes lentes.Les éventuelles modifications de configuration des logs de ce services pourront-être perdues suite à une mise à jour de BlueMind. |
| Milter | bm-milter | ./bm-milter/milter.log | LogBack | Analyse et modification des emails au niveau SMTP |
| XMPP | bm-xmpp | ./bm-xmpp/xmpp.log | LogBack | Logs de la messagerie instantanée |
| YSNP | bm-ysnp | ./bm-ysnp/ysnp.log | LogBack | Service permettant à Postfix ou Cyrus d'obtenir ou valider certaines données auprès de BlueMind :* authentification SMTP et IMAP
* résolution des ACLs IMAP
* blocage du flux mail dans les cas où BlueMind est en maintenance ou mise à jour
 |
| PostgreSQL | bm-postgresql | ./postgresql | Interne+logrotate | Logs de la base de données [PostgreSQL](http://postgresql.org/)Il est possible de modifier sa configuration via l'utilisation du fichier */etc/postgresql/9.6/main/postgresql.conf.local* |
| NGinx | bm-nginx | ./nginx :* access.log
* error.log
* webmail.log
 | Interne+logrotate | Le service [NGinx](http://nginx.org/) permet l'accès en HTTP et HTTPs à BlueMind.* `access.log` contient l'ensemble des requête HTTP et HTTPs faites à BlueMind
* `error.log` contient l'ensemble des requêtes HTTP et HTTPs en erreur ou dont le code retour indique une erreur (4xx, 5xx)
* `webmail.log` contient l'ensemble des requêtes HTTP et HTTPs faites via le webmail en erreur ou dont le code retour indique une erreur (4xx, 5xx)
 |


