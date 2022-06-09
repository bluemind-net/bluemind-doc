---
title: "Probleme bei Suche und Indizierung"
confluence_id: 57771851
position: 76
---
# Probleme bei Suche und Indizierung


- [Die Suchleiste bietet nicht die Möglichkeit, in allen Ordnern zu suchen](#Problemesderechercheetindexation-DieSuchleistebietetnichtdieMöglichkeit,inallenOrdnernzusuchen)
- [Es fehlen Ergebnisse in der Suche](#Problemesderechercheetindexation-EsfehlenErgebnisseinderSuche)
- [Bei einer Suche wird ein Fehler angezeigt](#Problemesderechercheetindexation-BeieinerSuchewirdeinFehlerangezeigt)
- [Beim Zugriff auf eine über eine Suche gefundene Nachricht wird ein Fehler angezeigt](#Problemesderechercheetindexation-BeimZugriffaufeineübereineSuchegefundeneNachrichtwirdeinFehlerangezeigt)
- [ElasticSearch (ES) wechselt in den "read only"-Modus](#Problemesderechercheetindexation-ElasticSearch(ES)wechseltinden"readonly"-Modus)
- [Logdateien zeigen Fehler in Bezug auf esQuota- und imapQuota-Kontingente an](#Problemesderechercheetindexation-LogdateienzeigenFehlerinBezugaufesQuota-undimapQuota-Kontingentean)
- [Globale Störung](#Problemesderechercheetindexation-GlobaleStörung)


## Die Suchleiste bietet nicht die Möglichkeit, in allen Ordnern zu suchen

### Für alle Benutzer

Wenn dies bei allen Benutzern der Fall ist, liegt es wahrscheinlich an einer Mail-Migration auf Dateisystemebene. Das bedeutet, dass der Suchindex von Elasticsearch nicht existiert: Sie können die Aufgabe `ConsolidateMailSpoolIndexJob` ausführen, um den Index zu erstellen und alle Mails des Servers zu indizieren:

- gehen Sie zur Administrationskonsole > Systemadministration > Planung > führen Sie die Aufgabe `ConsolidateMailSpoolIndexJob` aus


oder

- führen Sie mit dem [Kommandozeilen-Tool](https://forge.bluemind.net/confluence/display/BM35/Reference+des+commandes+bm-cli#Referencedescommandesbm-cli-Maintenance) die Wartungsoperation consolidateIndex durch:


```
bm-cli maintenance consolidateIndex domain.net
```

Da diese Operation mit einem hohen Ressourcenverbrauch verbunden ist, ist es möglich, sie mit der Option --match für Gruppen von Benutzern auszuführen:


```
bm-cli maintenance consolidateIndex --match "a.\*" domain.net
bm-cli maintenance consolidateIndex --match "[b-c].\*" domain.net
```


### Einige Benutzer

Wenn das Problem nur einen oder wenige Benutzer betrifft, bedeutet dies, dass der ElasticSearch-Index, der sie betrifft, nicht vorhanden oder beschädigt ist; er muss neu erstellt werden:

- entweder, indem Sie im Verwaltungsformular jedes Benutzers auf die Registerkarte "Wartung" gehen und auf **"Validieren und reparieren**" und dann auf **"Index konsolidieren**" klicken
- oder mit [dem Kommandozeilen-Tool](https://forge.bluemind.net/confluence/display/BM35/Reference+des+commandes+bm-cli#Referencedescommandesbm-cli-Maintenance):


```
bm-cli maintenance repair user@domain.net
bm-cli maintenance consolidateIndex user@domain.net 
```


## Es fehlen Ergebnisse in der Suche

Bei temporären Problemen mit dem Indizierungsdienst ist es möglich, dass einige in diesem Zeitraum gesendete und empfangene Nachrichten nicht indiziert wurden. In diesem Fall führen Sie einfach die Task `ConsolidateMailSpoolIndexJob` aus, die die Differenz zwischen den Nachrichten auf IMAP-Ebene und im Index berechnet und nur die fehlenden Nachrichten indiziert.

## Bei einer Suche wird ein Fehler angezeigt

Dies kann auf eine Inkonsistenz zwischen der Liste der Ordner auf IMAP-Ebene und in der Datenbank zurückzuführen sein, die Wartungsaktion "Validieren und reparieren" (Operation *check&repair*), die über die Registerkarte "Wartung" des Benutzerstammsatzes zugänglich ist, ermöglicht es, diese Liste neu aufzubauen. Eine Neuindizierung des Posteingangs muss das Problem beheben (auf derselben Registerkarte "Index des Posteingangs neu aufbauen").

Falls nicht, liegt der Ursprung des Problems möglicherweise in den Logdateien `/var/log/bm-webmail/errors`.

## Beim Zugriff auf eine über eine Suche gefundene Nachricht wird ein Fehler angezeigt

Es handelt sich wahrscheinlich um einen bei Verschieben der Nachricht entstandenen Indizierungsfehler. Die Wartungsaktion "Posteingang konsolidieren", die über die Registerkarte "Wartung" des Benutzerstammsatzes zugänglich ist, ermöglicht die Aktualisierung des Suchindexes.

## ElasticSearch (ES) wechselt in den "read only"-Modus

** **Problem**:** ES versetzt sich in den "read only"-Modus, der Cluster ist grün, aber ein Neustart behebt das Problem nicht

** **Festgestellte Symptome****: BlueMind scheint insgesamt nicht mehr zu funktionieren, neben den Problemen bei Suche und Anzeige ist es nicht möglich, Termine zu erstellen, Mails zu beantworten, usw.

** **Bestätigung**:** In den ElasticSearch-Logdateien ein Trace dieses Typs zu finden:


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


** **Ursache****: Der Speicherplatz auf dem Server ist zu klein

** **Lösung**:**

1. Speicherplatz hinzufügen (Partition vergrößern, Festplatte wechseln usw.)
2. Sobald dies geschehen ist, geben Sie den folgenden Befehl ein:


```
curl -X PUT "localhost:9200/\_all/\_settings" -H 'Content-Type: application/json' -d'{ "index.blocks.read\_only\_allow\_delete" : false } }'
```


## Logdateien zeigen Fehler in Bezug auf esQuota- und imapQuota-Kontingente an

Meldungen wie diese sind in der Datei `/var/log/bm-webmail/errors` zu finden:


```
10-Nov-2019 17:37:38 UTC] [jdoe@bluemind.loc] esQuota < (imapQuota \* 0.8). disable es search. esQuota: 4199171, imapQuota: 6123568 
```


Das bedeutet, dass für das angegebene Konto weniger als 80 % des Posteingangs indiziert sind (esQuota = quota elasticsearch), die elasticsearch-Suche (== die erweiterte Suchmaschine) ist daher deaktiviert, da sie ineffizient ist.

Um dies zu beheben, muss das Konto konsolidiert oder neu indiziert werden.

#### Für einige identifizierte Benutzer

Wenn das Problem nur einen oder wenige Benutzer betrifft, bedeutet dies, dass der ElasticSearch-Index, der sie betrifft, nicht vorhanden oder beschädigt ist; er muss neu erstellt werden:

- Entweder, indem Sie in der Administrationsdatei jedes Benutzers auf **"Validieren und reparieren**", dann auf **"Index konsolidieren**" und dann, wenn keine Verbesserung eintritt, auf "**Index neu aufbauen**" klicken
- oder mit [dem Kommandozeilen-Tool](/Guide_de_l_administrateur/Administration_avancee/Client_CLI_pour_l_administration/):


```
bm-cli maintenance repair user@domain.net
bm-cli maintenance consolidateIndex user@domain.net 
```


#### Für alle betroffenen Benutzer

Um alle betroffenen Konten zu reparieren, können Sie wie folgt vorgehen:

1. die Konten durch einen grep auf der Logdatei abrufen:


```
grep "disable es search. esQuota:" /var/log/bm-webmail/errors
```


2. die gefundenen Logins in eine Textdatei kopieren (z.B. `/tmp/accountWithoutEsSearch.txt`)
3. verwenden Sie die folgende Befehlskombination, um die Indexkonsolidierung für jeden Login der Datei zu starten:


```
while read account; do bm-cli maintenance consolidatedIndex $account;done < /tmp/accountWithoutEsSearch.txt
```


## Globale Störung

### Analyse

Wenn Sie eine **Fehlfunktion der Suche in BlueMind** bemerken, können Sie den Zustand des *ElasticSearch*-Clusters mit dem folgenden Befehl aufrufen:


```
$ curl -XGET --silent 'http://localhost:9200/\_cluster/health'
```


Wenn der Status 'green' ist, ist alles in Ordnung, wenn er 'red' ist, liegt ein Problem mit Elasticsearch vor. Diese Informationen werden auch in der [Monitoringkonsole](https://forge.bluemind.net/confluence/display/BM35/Console+de+monitoring) angezeigt.

Mit dem [Kommandozeilen-Administrationswerkzeug](/Guide_de_l_administrateur/Administration_avancee/Client_CLI_pour_l_administration/) können Sie den Indexstatus eines bestimmten Benutzers anzeigen:


```
$ bm-cli index info admin@local.lan
{"email":"jdoe@domain.loc","ESQuota":3056,"IMAPQuota":3058,"ratio":95}
```


### Lösung

Mehrere Bedingungen können verhindern, dass ElasticSearch funktioniert:

- **Ein unzureichend indizierter Posteingang**: Wenn der Index (siehe oben) ein **Verhältnis von weniger als 80** anzeigt, bedeutet dies, dass weniger als 80 % der E-Mails des Benutzers indiziert sind ![](../../attachments/57769989/69896490.png) eine Neuindizierung des Posteingangs durchführen:
    - zur BlueMind-Administrationskonsole gehen
    - Verwaltungsdatei des Benutzers > Registerkarte Wartung
    - **den Vorgang "Posteingang-Index neu aufbauen" ausführen**
- **Beschädigung des Index**: Hauptsächlich aufgrund eines Mangels an Festplattenplatz, der **freie Festplattenplatz muss mindestens 10 % betragen**. Wenn auf dem Datenträger mit den ES-Daten (/var/spool/bm-elasticsearch) nicht genug Platz verfügbar war, ist es möglich, dass die Suchindizes beschädigt sind. In den ES-Logdateien führt dies zu einem Fehler beim Starten des Dienstes:


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

Gehen Sie in diesem Fall wie folgt vor:

    1. Die Indexdateien löschen und ElasticSearch neu starten:


```
service bm-elasticsearch stop
rm -rf /var/spool/bm-elasticsearch/data/nodes/0/indices/\*
service bm-elasticsearch start
```


    2. Indizes zurücksetzen:


```
bm-cli index reset mailspool
bm-cli index reset mailspool\_pending
bm-cli index reset event
bm-cli index reset contact
bm-cli index reset todo
bm-cli index reset im
```


    3. Starten Sie dann eine neue Indizierung aus der Verwaltung der geplanten Aufgaben: Administrationskonsole > Systemadministration > Planung > wählen Sie die Domain "global.virt" und starten Sie die Aufgaben *IndexJob:

        - CalendarIndexJob
        - ContactIndexJob
        - ConsolidateMailSpoolIndexJob


:::info

Aber aufgepasst: das Indizieren von E-Mails ist ein Vorgang, der viel Zeit in Anspruch nimmt ** und es ist ratsam, diese Aufgabe abends oder am Wochenende zu starten**. Es ist außerdem möglich, mit [bm-cli](#) die Batch-Indizierung zu starten.

:::

        - TodoListIndexJob
        - HSMIndexJob


- **Beschädigung des `translog` **: Dies kann bei einem **Server-Absturz oder fehlendem Speicherplatz** geschehen. In diesem Fall wird der allgemeine Index nicht beschädigt und nur die Indizierung der letzten noch nicht auf die Festplatte geschriebenen Dokumente geht verloren.
In ES-Protokollen führt dies zu diesem Fehler beim Starten des Dienstes:


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

Entfernen eines beschädigten Translog:


```
service bm-elasticsearch stop
rm -rf /var/spool/bm-elasticsearch/data/nodes/0/indices/mailspool/\*/translog
service bm-elasticsearch start
```

Durch Ausführen der Aufgabe `ConsolidateMailSpoolIndexJob` werden die fehlenden Mails neu indiziert


