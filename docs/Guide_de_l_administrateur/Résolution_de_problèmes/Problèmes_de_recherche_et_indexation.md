---
title: "Problèmes de recherche et indexation"
confluence_id: 57771851
sidebar_position: 76
---
# Problèmes de recherche et indexation


- [La barre de recherche ne propose pas l'option pour rechercher dans tous les dossiers](#Problemesderechercheetindexation-Labarrederechercheneproposepasl'optionpourrechercherdanstouslesdossiers)
- [Il manque des résultats dans la recherche](#Problemesderechercheetindexation-Ilmanquedesrésultatsdanslarecherche)
- [Une erreur s'affiche lors d'une recherche](#Problemesderechercheetindexation-Uneerreurs'affichelorsd'unerecherche)
- [Une erreur s'affiche lors de l'accès à un message trouvé par une recherche](#Problemesderechercheetindexation-Uneerreurs'affichelorsdel'accèsàunmessagetrouvéparunerecherche)
- [ElasticSearch passe en mode "read only"](#Problemesderechercheetindexation-ElasticSearchpasseenmode"readonly")
- [Les logs indiquent des erreurs à propos des quotas esQuota et imapQuota](#Problemesderechercheetindexation-LeslogsindiquentdeserreursàproposdesquotasesQuotaetimapQuota)
- [Dysfonctionnement global](#Problemesderechercheetindexation-Dysfonctionnementglobal)


## La barre de recherche ne propose pas l'option pour rechercher dans tous les dossiers

### Pour l'ensemble des utilisateurs

Si c'est le cas pour l'ensemble des utilisateurs, cela fait probablement suite à une migration des mails au niveau du système de fichier. Cela signifie que l'index de recherche d'Elasticsearch n'existe pas : vous pouvez exécuter la tâche `ConsolidateMailSpoolIndexJob` pour créer l'index et indexer l'ensemble des mails du serveur :

- se rendre dans la console d'administration > Gestion du système > Planification > exécuter la tâche `ConsolidateMailSpoolIndexJob`


ou

- grâce à [l'outil en ligne de commande](https://forge.bluemind.net/confluence/display/BM35/Reference+des+commandes+bm-cli#Referencedescommandesbm-cli-Maintenance) exécuter l'opération de maintenance consolidateIndex :


```
bm-cli maintenance consolidateIndex domain.net
```

Cette opération étant lourde en consommation de ressource, il est possible de l'exécuter par groupes d'utilisateurs grâce à l'option --match :


```
bm-cli maintenance consolidateIndex --match "a.\*" domain.net
bm-cli maintenance consolidateIndex --match "[b-c].\*" domain.net
```


### Pour quelques utilisateurs

Si le problème ne concerne qu'un ou quelques utilisateurs, cela signifie que l'index ElasticSearch les concernant est inexistant ou corrompu, il faut le recréer :

- soit en se rendant sur la fiche d'administration de chaque utilisateur, onglet Maintenance et en cliquant sur "**Valider et réparer**" puis "**Consolider l'index**"
- soit grâce à [l'outil en ligne de commande](https://forge.bluemind.net/confluence/display/BM35/Reference+des+commandes+bm-cli#Referencedescommandesbm-cli-Maintenance) :


```
bm-cli maintenance repair user@domain.net
bm-cli maintenance consolidateIndex user@domain.net 
```


## Il manque des résultats dans la recherche

En cas de problèmes temporaires avec le service d'indexation il est possible que certains messages envoyés et reçus pendant cette période n'aient pas été indexés, dans ce cas il suffit d’exécuter la tâche `ConsolidateMailSpoolIndexJob` qui va calculer la différence entre les messages au niveau IMAP et dans l'index puis indexer uniquement les messages manquants.

## Une erreur s'affiche lors d'une recherche

Cela peut provenir d'une incohérence entre la liste des dossiers au niveau IMAP et dans la base de données, l'action de maintenance "Valider et réparer" (opération* check&repair*) accessible depuis l'onglet Maintenance de la fiche utilisateur permet de reconstruire cette liste, une ré-indexation de la boite de messagerie doit ensuite corriger le problème (sur le même onglet "Reconstruire l'index de la boîte").

Si ce n'est pas le cas, les logs `/var/log/bm-webmail/errors` peuvent indiquer l'origine du problème.

## Une erreur s'affiche lors de l'accès à un message trouvé par une recherche

Il s'agit probablement d'un défaut d'indexation lorsque qu'un message a été déplacé, l'action de maintenance "Consolider la boite mail" accessible depuis l'onglet Maintenance de la fiche utilisateur permet de mettre à jour l'index de recherche.

## ElasticSearch passe en mode "read only"

** **Problème** :** ES se met lui-même en mode "read only", le cluster est vert mais un redémarrage ne corrige pas le problème

** **Symptômes constatés** :** globalement BlueMind semble ne plus fonctionner, outre les problème de recherche et affichage il est impossible de créer des événements, répondre à des mails, etc.

** **Confirmation** :** Dans les logs ElasticSearch, on trouve une trace semblable à celle-ci :


```
2018-12-27 08:15:58,273 [BM-Core21] n.b.c.r.b.RestServiceMethodHandler ERROR - Error during restcall RestRequest [path=/internal-api/db\_message\_bodies/bm-master\_\_blue-mind\_loc/8b904e61a5d73ceb8b7e02048986a1740c94b3bb, method=PUT, User-Agent=null, params=, remoteAddresses=[192.168.132.14], origin=null]:  class net.bluemind.core.api.fault.ServerFault: java.util.concurrent.ExecutionException: ClusterBlockException[blocked by: [FORBIDDEN/12/index read-only / allow delete (api)];]
    at net.bluemind.backend.mail.replica.service.internal.DbMessageBodiesService.create(DbMessageBodiesService.java:101)
    ... 18 common frames omitted
Caused by:
  class java.util.concurrent.ExecutionException: ClusterBlockException[blocked by: [FORBIDDEN/12/index read-only / allow delete (api)];]
    at java.util.concurrent.CompletableFuture.reportGet(CompletableFuture.java:357)
    at java.util.concurrent.CompletableFuture.get(CompletableFuture.java:1915)
    at net.bluemind.backend.mail.replica.service.internal.DbMessageBodiesService.create(DbMessageBodiesService.java:98)
    ... 18 common frames omitted

2018-12-27 08:15:58,274 [vert.x-eventloop-thread-1] n.b.b.c.r.s.s.ReplicationState ERROR - addMessage.create: java.util.concurrent.ExecutionException: ClusterBlockException[blocked by: [FORBIDDEN/12/index read-only / allow delete (api)];]
net.bluemind.core.api.fault.ServerFault: java.util.concurrent.ExecutionException: ClusterBlockException[blocked by: [FORBIDDEN/12/index read-only / allow delete (api)];]
    at net.bluemind.core.rest.base.codec.JsonObjectCodec.parseFault(JsonObjectCodec.java:111)
    at net.bluemind.core.rest.base.codec.DefaultResponseCodecs$VoidCodec.decode(DefaultResponseCodecs.java:288)
    at net.bluemind.core.rest.base.codec.DefaultResponseCodecs$VoidCodec.decode(DefaultResponseCodecs.java:1)
    at net.bluemind.core.rest.base.ClientProxyGenerator$MethodCallBuilder.parseResponse(ClientProxyGenerator.java:417)
    at net.bluemind.core.rest.base.ClientProxyGenerator$EventMethodInvoker$1.success(ClientProxyGenerator.java:215)
    at net.bluemind.core.rest.base.ClientProxyGenerator$EventMethodInvoker$1.success(ClientProxyGenerator.java:1)
    at net.bluemind.core.rest.log.CallLogger$1.success(CallLogger.java:48)
    at net.bluemind.core.rest.log.CallLogger$1.success(CallLogger.java:1)
    at net.bluemind.core.rest.base.RestRootHandler$1.success(RestRootHandler.java:130)
    at net.bluemind.core.rest.base.RestRootHandler$1.success(RestRootHandler.java:1)
    at net.bluemind.core.rest.base.RestRootHandler$VertxAwareAsyncHandler$1.handle(RestRootHandler.java:172)
    at net.bluemind.core.rest.base.RestRootHandler$VertxAwareAsyncHandler$1.handle(RestRootHandler.java:1)
    at org.vertx.java.core.impl.DefaultContext$2.run(DefaultContext.java:144)
    at org.vertx.java.core.impl.DefaultContext$3.run(DefaultContext.java:175)
    at io.netty.util.concurrent.SingleThreadEventExecutor.runAllTasks(SingleThreadEventExecutor.java:399)
    at io.netty.channel.nio.NioEventLoop.run(NioEventLoop.java:464)
    at io.netty.util.concurrent.SingleThreadEventExecutor$2.run(SingleThreadEventExecutor.java:131)
    at io.netty.util.concurrent.FastThreadLocalRunnable.run(FastThreadLocalRunnable.java:30)
    at java.lang.Thread.run(Thread.java:748)
2018-12-27 08:15:58,274 [vert.x-eventloop-thread-1] n.b.b.c.r.s.c.ApplyMessage INFO - Finished ApplyMessage.
2018-12-27 08:15:58,274 [vert.x-eventloop-thread-1] n.b.b.c.r.s.ReplicationSession INFO - REPL S: [frame-00001297]: OK success

```


** **Cause** :** l'espace disque sur le serveur est trop juste

** **Solution** :**

1. ajouter de l'espace disque (agrandir la partition, changer le disque, etc.)
2. une fois fait, jouer la commande suivante :


```
curl -X PUT "localhost:9200/\_all/\_settings" -H 'Content-Type: application/json' -d'{ "index.blocks.read\_only\_allow\_delete" : false } }'
```


## Les logs indiquent des erreurs à propos des quotas esQuota et imapQuota

On trouve des messages comme celui-ci dans le le fichier `/var/log/bm-webmail/errors` :


```
10-Nov-2019 17:37:38 UTC] [jdoe@bluemind.loc] esQuota < (imapQuota \* 0.8). disable es search. esQuota: 4199171, imapQuota: 6123568 
```


Cela signifie que pour le compte indiqué, moins de 80% de la boite est indexé (esQuota = quota elasticsearch), la recherche elasticsearch (== le moteur de recherche avancé) est donc désactivée car inefficace.

Pour réparer cela, il faut procéder à une consolidation ou réindexation du compte.

#### Pour quelques utilisateurs identifiés

Si le problème ne concerne qu'un ou quelques utilisateurs, cela signifie que l'index ElasticSearch les concernant est inexistant ou corrompu, il faut le recréer :

- soit en se rendant sur la fiche d'administration de chaque utilisateur et en cliquant sur "**Valider et réparer**" puis "**Consolider l'index**" puis, si pas d'amélioration, "**Reconstruire l'index**"
- soit grâce à [l'outil en ligne de commande](/Guide_de_l_administrateur/Administration_avancée/Client_CLI_pour_l_administration/) :


```
bm-cli maintenance repair user@domain.net
bm-cli maintenance consolidateIndex user@domain.net 
```


#### Pour l'ensemble des utilisateurs impactés

Pour réparer l'ensemble des comptes impactés, vous pouvez faire comme suit :

1. retrouver les comptes par un grep sur le fichier de log :


```
grep "disable es search. esQuota:" /var/log/bm-webmail/errors
```


2. copier les logins ainsi trouvés dans un fichier texte (par exemple `/tmp/accountWithoutEsSearch.txt`)
3. utiliser la combinaison de commandes suivantes pour lancer la consolidation d'index sur chacun des logins du fichier :


```
while read account; do bm-cli maintenance consolidatedIndex $account;done < /tmp/accountWithoutEsSearch.txt
```


## Dysfonctionnement global

### Analyse

Si vous constatez un **dysfonctionnement de la recherche dans BlueMind** vous pouvez consulter l'état du *cluster* ElasticSearch avec la commande :


```
$ curl -XGET --silent 'http://localhost:9200/\_cluster/health'
```


Si le statut est 'green' tout va bien, s'il est 'red' cela signifie qu'il y a un problème au niveau d'Elasticsearch. Cette information remonte également dans la [console de monitoring](https://forge.bluemind.net/confluence/display/BM35/Console+de+monitoring).

Grâce à [l'outil d'administration en ligne de commande](/Guide_de_l_administrateur/Administration_avancée/Client_CLI_pour_l_administration/), vous pouvez consulter l'état de l'index d'un utilisateur donné :


```
$ bm-cli index info admin@local.lan
{"email":"jdoe@domain.loc","ESQuota":3056,"IMAPQuota":3058,"ratio":95}
```


### Résolution

Plusieurs conditions peuvent empêcher le fonctionnement d'ElasticSearch :

- **une boîte insuffisamment indexée** : si en consultant l'index (voir ci-dessus) on constate un **ratio inférieur à 80**, cela signifie que moins de 80% des emails de l'utilisateur sont indexés ![](../../attachments/57769989/69896490.png) procéder à une réindexation de la boîte :
    - se rendre dans la console d'administration de BlueMind
    - aller dans la fiche d'administration de l'utilisateur > onglet Maintenance
    - **exécuter l'opération "Reconstruire l'index de la boîte aux lettres"**
- **une corruption des index** : principalement à cause d'un manque d'espace disque, **il faut au minimum 10% d'espace disque libre**. Si le disque contenant les données d'ES (/var/spool/bm-elasticsearch) a manqué d'espace il est possible que les index de recherche soient corrompus. Dans les logs ES, cela se traduit par une erreur lors du démarrage du service :


```
[2017-01-26 20:06:54,764][WARN ][cluster.action.shard] [Bill Foster] [mailspool][0] received shard failed for [mailspool][0], node[PcC6eICxRAajmWioK1mhDA], [P], s[INITIALIZING], indexUUID 
[IEJHQkOnTtOcdY0bMMIFRA], reason [master [Bill Foster][PcC6eICxRAajmWioK1mhDA][bluemind.exa.net.uk][inet[/82.219.13.101:9300]] marked shard as initializing, but shard is marked as failed, resend shard failure]
[2016-01-26 20:06:55,828][WARN ][indices.cluster] [Bill Foster] [mailspool][0] failed to start shard
org.elasticsearch.index.gateway.IndexShardGatewayRecoveryException: [mailspool][0] failed to recover shard
        at org.elasticsearch.index.gateway.local.LocalIndexShardGateway.recover(LocalIndexShardGateway.java:287)
        at org.elasticsearch.index.gateway.IndexShardGatewayService$1.run(IndexShardGatewayService.java:132)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
        at java.lang.Thread.run(Thread.java:745)
```

Il faut alors :

    1. supprimer les fichiers d'index et redémarrer ElasticSearch :


```
service bm-elasticsearch stop
rm -rf /var/spool/bm-elasticsearch/data/nodes/0/indices/\*
service bm-elasticsearch start
```


    2. Réinitialiser les index :


```
bm-cli index reset mailspool
bm-cli index reset mailspool\_pending
bm-cli index reset event
bm-cli index reset contact
bm-cli index reset todo
bm-cli index reset im
```


    3. Puis lancer une nouvelle indexation depuis la gestion des tâches planifiées : Console d'administration > Gestion du système > Planification > sélectionner le domaine "global.virt" et lancer les tâches *IndexJob :

        - CalendarIndexJob
        - ContactIndexJob
        - ConsolidateMailSpoolIndexJob


:::info

Attention cependant, l'indexation des mails est une opération consommatrice en IO, **il est donc préférable de lancer cette tâche en soirée ou en week-end**. A noter qu'il est possible de lancer l'indexation par lot avec [bm-cli.](#)

:::

        - TodoListIndexJob
        - HSMIndexJob


- **une corruption du `translog` ** : cela peut se produire en cas de **crash du serveur ou de manque de mémoire**. Dans ce cas l'index général n'est pas corrompu et seule l'indexation des derniers documents non encore écrits sur le disque sera perdue.
Dans les logs ES, cela se traduit par cette erreur lors du démarrage du service :


```
[2017-09-04 19:24:38,340][WARN ][indices.cluster          ] [Hebe] [mailspool][1] failed to start shard
org.elasticsearch.index.gateway.IndexShardGatewayRecoveryException: [mailspool][1] failed to recover shard
	at org.elasticsearch.index.gateway.local.LocalIndexShardGateway.recover(LocalIndexShardGateway.java:287)
	at org.elasticsearch.index.gateway.IndexShardGatewayService$1.run(IndexShardGatewayService.java:132)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
	at java.lang.Thread.run(Thread.java:745)
Caused by: org.elasticsearch.index.translog.TranslogCorruptedException: translog corruption while reading from stream
	at org.elasticsearch.index.translog.ChecksummedTranslogStream.read(ChecksummedTranslogStream.java:70)
	at org.elasticsearch.index.gateway.local.LocalIndexShardGateway.recover(LocalIndexShardGateway.java:257)
	... 4 more
```

Pour supprimer les translog corrompu :


```
service bm-elasticsearch stop
rm -rf /var/spool/bm-elasticsearch/data/nodes/0/indices/mailspool/\*/translog
service bm-elasticsearch start
```

L’exécution de la tâche `ConsolidateMailSpoolIndexJob` va ré-indexer les mails manquants


