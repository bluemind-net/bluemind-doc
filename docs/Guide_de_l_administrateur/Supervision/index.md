---
title: "Supervision"
confluence_id: 57771639
position: 44
---
# Supervision


# Supervision du serveur

Au niveau serveur, il est conseillé de superviser les aspects suivants de la machine :

- occupation des **disques**
- utilisation de la mémoire **RAM**
- utilisation des **CPU**

:::important

Important
En cas de panne grave d'un composant BlueMind, un fichier *.hprof* est généré dans le répertoire`/var/log`.
:::

Il est donc primordial de pouvoir superviser l'apparition de tels fichiers.

Par défaut l'apparition d'un tel fichier est détecté par le système BlueMind et est enregistré sous forme d'erreur dans le fichier `/var/log/bm-node/node.log`.


Une commande pour réaliser manuellement cela peut être :


```
ls /var/log/*.hprof
```


Un tel fichier est nommé sous la forme suivante :

```
java\_pid1664.hprof
```

où `1664` est l'identifiant du processus ayant subi la panne. A partir de cet identifiant il est possible via les commandes `ps` ou `jps` de récupérer le composant responsable de la panne **avant** de redémarrer les services BlueMind.

# Supervision des services

BlueMind utilise des composants standards de messagerie (Cyrus Imap, Postfix, nginx, tomcat...), qui peuvent être supervisés par des outils standards.

De plus, les API permettent d'interroger le serveur de la même façon que les interfaces, permettant ainsi de s'assurer du bon fonctionnement du composant BM-Core.

La liste des processus BlueMind en cours de fonctionnement sur le serveur est accessible via la commande :


```
/usr/lib/jvm/bm-jdk/bin/jps -ml
```


En temps normal, les processus purement BlueMind attendus et que l'on peut superviser sont :

- 
`net.bluemind.eas.push`

- 
`org.elasticsearch.bootstrap.Elasticsearch start -p /var/run/bm-elasticsearch.pid`

- 
`net.bluemind.xmpp.server.launcher.tigase`

- 
`net.bluemind.lmtp.id1`

- 
`net.bluemind.ysnp.ysnp`

- 
`net.bluemind.application.launcher.coreLauncher`

- 
`net.bluemind.hornetq.mqsrv`

- 
`net.bluemind.webmodules.launcher.webLauncher`

- 
`net.bluemind.locator.app`

- 
`net.bluemind.node.server.nodelauncher`

- 
`net.bluemind.tika.server.tika`

- 
`net.bluemind.proxy.http.launcher.hpslauncher`


Parmi les composants standards utilisés par BlueMind on trouve également :

- postgresql
- postfix
- nginx
- bm-php-fpm
- cyrus (imapd et pop3d)


## Utilisation de SNMP

BlueMind ne fournit pas de sondes SNMP. Pour pouvoir superviser un serveur BlueMind via SNMP, il est donc nécessaire de mettre en place manuellement la supervision de chaque service précédemment cité.

## Scripts de supervision BlueMind

Afin de pouvoir superviser les services BlueMind, le paquet *bm-checks* doit être installé.

Une fois le paquet installé, des scripts de supervisions sont alors disponibles dans le répertoire */usr/share/bm-checks/*.

Pour les utiliser, lancer l'exécution de ces scripts bash de manière régulière, avec un cron par exemple.

Chaque script renvoie un code de retour dépendant du status du service BlueMind :

- 0 (zéro) si le service est fonctionnel
- 1 (un) si une erreur a été détectée


En cas d'erreur, un message est renvoyé sur la sortie standard.

# Supervision des logs

Les fichiers journaux des composants BlueMind sont récupérables dans le répertoire `/var/log` :

- `/var/log/bm/`
- `/var/log/bm-eas/`
- `/var/log/bm-elasticsearch/`
- `/var/log/bm-hps/`
- `/var/log/bm-mapi/`
- `/var/log/bm-lmtpd/`
- `/var/log/bm-locator/`
- `/var/log/bm-mq/`
- `/var/log/bm-node/`
- `/var/log/bm-tika/`
- `/var/log/bm-webserver/`
- `/var/log/bm-webmail/`
- `/var/log/bm-xmpp/`
- `/var/log/bm-ysnp/`


Pour les autres composants qu'il est possible de superviser, les emplacements suivants peuvent être utilisés :

- `/var/log/mail.err`
- `/var/log/mail.info`
- `/var/log/mail.log`
- `/var/log/mail.warn`
- `/var/log/nginx/`
- `/var/log/bm-php5-fpm.log`
- `/var/log/postgresql/`


# Pilotage par script

BlueMind utilise des scripts système standards pour l'arrêt et le démarrage des services.

Ainsi, la commande "`bmctl restart`" relance l'ensemble des services BlueMind.

# Réalisation d'opérations par script

Comme indiqué dans les sections relatives à l'intégration avec des applications tierces, BlueMind peut être totalement piloté par script.

A partir des API clientes (en PHP et Java), il est possible de réaliser n'importe quelle opération sur BlueMind, en particulier créer ou modifier un utilisateur, accéder à un agenda, ajouter un événement...


