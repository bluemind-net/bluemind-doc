---
title: "Log-Konfiguration"
confluence_id: 57771798
position: 66
---
# Log-Konfiguration


## Präsentation

BlueMind speichert Protokolldateien für jede Art von Anwendung und Nutzung.


:::info

Es ist wichtig, genügend Speicherplatz zur Verfügung zu stellen, um die Protokolldateien und ihre Archive speichern zu können.

Die Sättigung dieses Speicherplatzes verhindert die Aufzeichnung neuer Informationen in den Protokolldateien und kann dazu führen, dass Dienste langsamer werden oder sogar einfrieren.

:::


Es gibt 3 Arten von Protokolldateien :

- Systemprotokolle, verwaltet durch den Systemprotokoll-Verwaltungsmechanismus ([rsyslog](http://www.rsyslog.com/) + [logrotate](https://linux.die.net/man/8/logrotate))
- BlueMind Java-Dienstprotokolle, verwaltet von [LogBack](https://logback.qos.ch/)


:::info

Uhrzeit der Traces

Die von Java generierten Traces in diesen Dateien sind in GMT-Zeit.

So sind in Frankreich, in der Zeitzone Europa/Paris, die Stunden im Winter um 1 Stunde und im Sommer um 2 Stunden versetzt. Um nach Terminen zu suchen, die um 15 Uhr stattfanden, führen Sie folgende Suche durch:

- 14 Uhr von Ende Oktober bis Ende März
- 13 Uhr von Ende März bis Ende Oktober


:::

- Dienst-interne Protokolldateien, die über die Konfiguration dieses Dienstes verwaltet werden


Die Aufbewahrungsdauer hängt von den Einstellungen dieser Protokollverwaltungsmechanismen ab. Es ist möglich, ihre Konfiguration auf die gewünschte Aufbewahrungszeit zu ändern.

## LogBack-Konfiguration

Die Standardkonfigurationsdateien befinden sich im Verzeichnis `/usr/share/bm-conf/logs/`:

- bm-core-audit.log.xml
- bm-core.log.xml
- bm-eas.log.xml
- bm-hps.log.xml
- bm-ips.log.xml
- bm-lmtpd.log.xml
- bm-locator.log.xml
- bm-milter.log.xml
- bm-node.log.xml
- bm-pimp.log.xml
- bm-tika.log.xml
- bm-webserver.log.xml
- bm-xmpp.log.xml
- bm-ysnp.log.xml


Um Änderungen vorzunehmen, kopieren Sie die gewünschte Datei nach `/etc/bm/local` und ändern Sie die Kopie.

Konfigurationsbeispiel:


```
<appender name="R" class="ch.qos.logback.core.rolling.RollingFileAppender">
  <!--See also http://logback.qos.ch/manual/appenders.html#RollingFileAppender -->
  <File>/var/log/bm/core.log</File>
  <encoder>
    <pattern>%d [%thread] %c{1} %p - %m\n</pattern>
  </encoder>
  <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
    <maxIndex>20</maxIndex>
    <FileNamePattern>/var/log/bm/core.log.%i.gz</FileNamePattern>
  </rollingPolicy>
  <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
    <MaxFileSize>60000KB</MaxFileSize>
  </triggeringPolicy>
</appender
```


Das auf die Log-Hauptdatei core.log bezogene obige Beispiel ermöglicht es, 20 Logdateien von jeweils maximal 60 MB zu speichern.

Weitere Informationen zur Konfiguration finden Sie auf der [Log4j](https://logging.apache.org/log4j)-Website oder in dieser Dokumentation: [https://logback.qos.ch/manual/appenders.html#RollingFileAppender](https://logback.qos.ch/manual/appenders.html#RollingFileAppender)


