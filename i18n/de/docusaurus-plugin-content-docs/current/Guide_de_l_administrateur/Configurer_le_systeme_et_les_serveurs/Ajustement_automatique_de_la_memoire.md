---
title: "Automatische Speicheranpassung"
confluence_id: 57771328
position: 58
---
# Automatische Speicheranpassung

Der Standardspeicher der Java-Komponenten wird beim Start von BlueMind automatisch angepasst.

## Funktionsweise

Ein Programm `/usr/share/bm-pimp/bm-pimp` wird vor den bluemind-Init-Skripten gestartet und parametriert die Komponenten.

Wenn es gestartet wird, zeigt es die folgenden Ausgaben an:


```
root@prec:~# /etc/init.d/bm-pimp restart
2014-06-12 20:16:42,789 [main] n.b.p.PimpMyRam INFO - 2176MB is allocated for all heaps.
2014-06-12 20:16:42,791 [main] n.b.p.PimpMyRam INFO - 93% of spare memory will be allocated to java components
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - Total from JMX: 8181MB
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - 3063MB will be distributed between JVMs
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO -   \* bm-core gets +459MB for a total of 715MB
2014-06-12 20:16:42,831 [main] n.b.p.PimpMyRam INFO -   \* bm-node gets +0MB for a total of 128MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-eas gets +306MB for a total of 434MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-mapi gets +245MB for a total of 373MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-elasticsearch gets +1225MB for a total of 1353MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-mq gets +153MB for a total of 281MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-tika gets +0MB for a total of 128MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-xmpp gets +0MB for a total of 128MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-ysnp gets +0MB for a total of 128MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-lmtpd gets +153MB for a total of 409MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-milter gets +153MB for a total of 409MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-dav gets +0MB for a total of 128MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-locator gets +0MB for a total of 128MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-hps gets +153MB for a total of 281MB
```


Die Berechnung ist wie folgt:

> Der nutzbare Speicher wird berechnet, indem 5 GB vom Gesamtspeicher des Rechners abgezogen werden.
> 
> 50 % dieses nutzbaren Speichers werden dann auf die verschiedenen Java-Komponenten verteilt. Dieser Teil wird als *spare*bezeichnet.
> 
> In unserem vorherigen Beispiel beträgt *spare* 3063 MB:
> 
> ```
> 2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - 3063MB will be distributed between JVMs
> ```
> 
> 
Die Weiterverteilung erfolgt über die Regeldatei *rules.json*. Die in der Datei *rules.json* enthaltenen Regeln können vom Administrator überladen werden.

## Parametrierung

Um die Regeln für die Speicherzuweisung beim Start von BlueMind anzupassen, erstellen Sie eine Datei */etc/bm/local/rules.json* , in die Sie die Regeln schreiben, die vom Produkt angewendet werden sollen.

Beispiel für die Datei rules.json:

```
[
	{
		"product":"bm-core",
		"defaultHeap":256,
		"defaultDirect":256,
		"sparePercent":15
	},
	{
		"product":"bm-node",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":0
	},
	{
		"product":"bm-eas",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":10
	},
	{
		"product":"bm-mapi",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":8
	},
	{
		"product":"bm-elasticsearch",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":40
	}
]
```


In diesem Beispiel:

- bm-core erhält 256 MB + 15 % von *spare*, d.h. 459 MB:


```
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO -   \* bm-core gets +459MB for a total of 715MB
```


- bm-node wird nicht erhöht und beträgt immer 128 MB, unabhängig vom verfügbaren Speicher.

- elasticsearch erhält 128 + 40 % von *spare*.


Am Ende seiner Ausführung schreibt bm-pimp für jedes Produkt eine */etc/bm/default/&lt;product>.ini* Datei mit dem neuen Wert.

Der Inhalt dieser Datei kann lokal über eine */etc/bm/local/&lt;product>.ini*überladen werden.

## Protokolle

Die Logback-Konfiguration für jede Komponente wird extrahiert und beim Start der Komponente automatisch in der Datei */usr/share/bm-conf/logs/&lt;composant>.log.xml* gespeichert.

Diese Konfiguration kann überschrieben werden (um sie z. B. an eine Logstash / graylog2 zu senden), indem eine Kopie dieser Datei im Ordner */etc/bm/local/&lt;component>.log.xml* geändert wird


