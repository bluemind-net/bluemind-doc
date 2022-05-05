---
title: "Überwachung"
confluence_id: 57771639
position: 44
---
# Überwachung


## Server-Überwachung

Auf der Serverebene ist es ratsam, die folgenden Punkte zu überwachen:

- **Festplatten**-Belegung
- **RAM**-Auslastung
- **CPU**-Auslastung


:::info

Wichtig
Im Falle eines schwerwiegenden Fehlers einer BlueMind-Komponente wird eine *.hprof*-Datei im Verzeichnis `/var/log` erzeugt.
:::

Es ist daher unerlässlich, das Erscheinen solcher Dateien überwachen zu können.

Standardmäßig wird das Erscheinen einer solchen Datei vom BlueMind-System erkannt und als Fehler in der Datei `/var/log/bm-node/node.log` aufgezeichnet.


Zur manuellen Durchführung kann z.B. der folgende Befehl verwendet werden:


```
ls /var/log/\*.hprof
```


Eine solche Datei ist wie folgt benannt:

```
java\_pid1664.hprof
```

wobei `1664` den fehlgeschlagenen Prozess identifiziert. Anhand dieser Identifizierung ist es möglich, über `ps-` oder `jps`-Befehle die für den Fehler verantwortliche Komponente wiederherzustellen,** bevor** die BlueMind-Dienste neu gestartet werden.

## Überwachung der Dienste

BlueMind verwendet Standard-Messaging-Komponenten (Cyrus Imap, Postfix, nginx, tomcat...), die mit Standard-Tools überwacht werden können.

Darüber hinaus ermöglichen die APIs die Abfrage des Servers in der gleichen Weise wie die Schnittstellen, so dass die Funktionsfähigkeit der BM-Core-Komponente gewährleistet ist.

Der Zugriff auf die Liste der auf dem Server laufenden BlueMind-Prozesse erfolgt über den folgenden Befehl:


```
/usr/lib/jvm/bm-jdk/bin/jps -ml
```


Unter normalen Umständen sind die rein von BlueMind erwarteten und zu überwachenden Prozesse

- `net.bluemind.eas.push`

- `org.elasticsearch.bootstrap.Elasticsearch start -p /var/run/bm-elasticsearch.pid`

- `net.bluemind.xmpp.server.launcher.tigase`

- `net.bluemind.lmtp.id1`

- `net.bluemind.ysnp.ysnp`

- `net.bluemind.application.launcher.coreLauncher`

- `net.bluemind.hornetq.mqsrv`

- `net.bluemind.webmodules.launcher.webLauncher`

- `net.bluemind.locator.app`

- `net.bluemind.node.server.nodelauncher`

- `net.bluemind.tika.server.tika`

- `net.bluemind.proxy.http.launcher.hpslauncher`


Zu den von BlueMind verwendeten Standardkomponenten gehören auch:

- postgresql
- postfix
- nginx
- bm-php-fpm
- cyrus (imapd und pop3d)


### Verwendung von SNMP

BlueMind bietet keine SNMP-Sonden an. Um einen BlueMind-Server über SNMP überwachen zu können, ist es daher notwendig, die Überwachung jedes oben genannten Dienstes manuell einzurichten.

### BlueMind-Überwachungsskripte

Um BlueMind-Dienste zu überwachen, muss das Paket *bm-checks* installiert sein.

Nach der Installation des Pakets sind Überwachungsskripte im Verzeichnis */usr/share/bm-checks/* verfügbar.

Um sie zu verwenden, starten Sie die Ausführung dieser Bash-Skripte auf reguläre Art und Weise, z. B. mit einem Cron.

Jedes Skript gibt einen Rückgabecode zurück, der vom Status des BlueMind-Dienstes abhängt:

- 0 (Null), wenn der Dienst funktionsfähig ist
- 1 (eins), wenn ein Fehler erkannt wurde


Wenn ein Fehler auftritt, wird eine Meldung an dzn Standardausgang zurückgeschickt.

## Log-Überwachung

Die Protokolldateien der BlueMind-Komponenten sind im Verzeichnis `/var/log` abrufbar:

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


Für andere Komponenten, die überwacht werden können, können die folgenden Orte verwendet werden:

- `/var/log/mail.err`
- `/var/log/mail.info`
- `/var/log/mail.log`
- `/var/log/mail.warn`
- `/var/log/nginx/`
- `/var/log/bm-php5-fpm.log`
- `/var/log/postgresql/`


## Skriptsteuerung

BlueMind verwendet Standard-Systemskripte zum Stoppen und Starten von Diensten.

So startet der Befehl "`bmctl restart`" alle BlueMind-Dienste neu.

## Ausführen von Operationen per Skript

Wie in den Abschnitten über die Integration mit Drittanwendungen erwähnt, kann BlueMind vollständig per Skript gesteuert werden.

Über die Client-APIs (in PHP und Java) ist es möglich, jede beliebige Operation auf BlueMind durchzuführen, insbesondere einen Benutzer anzulegen oder zu ändern, auf einen Terminplaner zuzugreifen, einen Termin hinzuzufügen...


