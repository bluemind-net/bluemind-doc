---
title: "Metrik-Referenz"
confluence_id: 57771727
position: 64
---
# Metrik-Referenz


## Präsentation

Das Packaging-Tick von BlueMind ermöglicht das Monitoring einer großen Anzahl von Daten (*Metriken* genannt). Einige der überwachten Daten sind roh, andere werden jedoch vorverarbeitet, um eine größere Relevanz zu erhalten und die Interpretation und Analyse zu erleichtern.

Jede Metrik hat eine Baumstruktur, die folgende Elemente enthalten kann:

- **datalocation**: Servername
- **host**: Name oder IP des Hosts
- **meterType**: der Datentyp
    - *gauge*: momentane Messung
    - *counter*: inkrementaler Zähler
    - *distsum*: Datenpaar bestehend aus einem Zähler und einer Menge, z. B.:
        - bm-lmtpd.emailSize = (Anzahl der Emails, Gesamtgröße der Emails)
        - bm-lmtpd.emailRecipients = (Anzahl der Emails, Anzahl der Empfänger)
    - *timer*: wie distsum, aber die Menge wird immer in Nanosekunden angegeben
- **status**: je nach Art der Daten kann es sich um einen Status ok/failed handeln (z.B. erfolgreiche/fehlgeschlagene Anfrage), success/failure (z.B. erfolgreiche/fehlgeschlagene Authentifizierung) usw.


## Gemeinsame Daten

Im Allgemeinen sind die Metriken nach Komponenten gruppiert.

##### JVM

Für jede Komponente können Sie die Metriken für die JVM finden:

- **bm-&lt;Komponente>.hprof**: Die Anzahl der auf dem Rechner vorhandenen hprof-Dateien ermöglicht festzustellen, ob es einen Absturz gab
- **bm-&lt;Komponente>.jvm.*** alle jvm-Informationen für diese Komponente (aktueller Speicherverbrauch, Maximum, etc.)


##### Heartbeat

In jeder Komponente, die mit dem Core interagiert, werden die folgenden Metriken verwendet, um zu überwachen, dass die Core-Zustandsdaten *(Heartbeat*)  von der Komponente empfangen werden:

| Name der Metrik | Typ | Inhalt | Weitere Informationen |
| --- | --- | --- | --- |
| heartbeat.receiver.age | Gauge | Alter des letzten  | *Heartbeat* | -Empfangs | 
Entspricht der Zeit zwischen 2 *Heartbeats*.
 | 
Der Core soll alle 4 Sekunden seinen Gesundheitszustand senden, längere Abstände, die ggf. 8 Sekunden überschreiten, müssen daher als Funktionswarnung gedeutet werden.
 |
| heartbeat.receiver.failures | Counter | Anzahl der Empfangsfehlschläge | 


 |
| heartbeat.receiver.latency | Gauge | *heartbeat* | -Eingangsdauer | Zeit zwischen dem Senden des  | *Heartbeats* |  durch den Core und dem Empfang durch die Komponente |
| heartbeat.receiver.latencyMax | Gauge | maximale Eingangsdauer | 


 |
| heartbeat.receiver.received | Counter | Anzahl der Empfänge OK | 


 |

##### Hazelcast

Server, die Mitglieder des Hazelcast-Clusters sind, haben die folgende Metrik:

| Name der Metrik | Typ | Inhalt | Weitere Informationen |
| --- | --- | --- | --- |
| cluster.members | Gauge | 


 | der Wert dieser Metrik muss '3' sein |

## Metriken

| Name der Metrik | Typ | Inhalt | Weitere Informationen | bm-core | BlueMind Hauptmaschine | bm-eas | mobiler Verbindungsdienst | bm-hps | Authentifizierungsdienst | bm-lmtpd | E-Mail-Zustelldienst | bm-locator | Lokalisierung der Dienste | bm-filter | Analyse und Modifikation von E-Mails auf SMTP-Ebene | bm-webserver | Web-Anwendungsserver | bm-xmpp | Instant-Messaging-Dienst | bm-ysnp | Datenvalidierungsdienst | Andere |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| agent.metricsGathered | Counter | Anzahl der vom Agent gesammelten Metriken | Diese Metrik wird hauptsächlich verwendet, um zu überprüfen, ob der Agent noch in Betrieb ist: das Fehlen von Daten zeigt an, dass der Agent nichts mehr sammelt, also nicht mehr funktioniert |
| agent.vmware* | 


 | Daten, die den Rechner betreffen, auf dem der Agent läuft | 
Der Agent ist nur aktiv, wenn *vmware-Tools* auf Rechnern erkannt wird, auf denen BlueMind gehostet wird. In diesem Fall werden die Metriken des "*vSphere Guest SDK*" extrahiert und historisiert.
 | 
Diese Metriken können verwendet werden, um Probleme zu diagnostizieren, die mit der Art und Weise zusammenhängen, wie BlueMind auf vmware virtualisiert wurde.
 |
| bluemind.cluster | 


 | 


 | 


 |
| bluemind.cluster.partitions | 


 | 


 | 


 |
| callsCount | Counter | Anzahl der vom Core empfangenen Anrufe | 


 |
| dirVersion | Gauge | 


 | 


 |
| directory.cluster.events | Counter | 


 | 


 |
| handlingDuration | Timer | Anfragebearbeitungszeit | 


 |
| heartbeat.broadcast | Counter | 


 | 


 |
| heartbeat.maxPeriod | Gauge | 


 | 


 |
| heartbeat.period | Gauge | 


 | 


 |
| executionTime | Timer | 


 | 


 |
| responseSize | DistSum | 


 | 


 |
| authCount | Counter | Anzahl der Verbindungsanfragen für BlueMind | 
- status success: Verbindung erfolgreich
- status failed: Verbindung fehlgeschlagen (falsches Login und/oder Passwort)

 |
| ftlTemplates.requests | Counter | Anzahl der angeforderten generierten Seiten | 


 |
| requestsCount | Counter | Anzahl der bedienten Anfragen pro hps | 
- kind: maintenance - Anzeige der Wartungsseite
- kind: protected - Anzeige einer geschützten Seite

 | 
Ermöglicht insbesondere die Überprüfung der Anzahl der tatsächlichen Anzeigen der  Wartungsseite. Zu viele "Wartungsanfragen" können ein Zeichen für ein Problem sein.
 |
| staticFile.requests | Counter | Anzahl der angeforderten statischen Seiten | Beispiel: Login-Seite |
| upstreamRequestSize | DistSum | Anforderungsgröße | 


 |
| upstreamRequestTime | Timer | Anfragebearbeitungszeit | 


 |
| upstreamRequestsCount | Counter | Anzahl der Anfragen | 


 |
| activeConnections | Gauge | Anzahl der aktiven Verbindungen | 


 |
| connectionCount | Counter | 


 | 


 |
| deliveries | Counter | 


 | 


 |
| emailRecipients | DistSum | Anzahl von Empfängern pro E-Mail | 


 |
| emailSize | DistSum | Größe der E-Mails | 


 |
| sessionDuration | Timer | Sitzungsdauer | 


 |
| traffic.transportLatency | Timer | 


 | 


 |
| executionTime | Timer | Abfrage-Durchlaufzeit | 


 |
| requestsCount | Counter | Anzahl der vom Dienst empfangenen Anfragen | 
- Origin: Komponente, die die Anfrage gestellt hat
- statusCode: http-Rückgabecode

 |
| connectionsCount | Counter | 


 | 


 |
| sessionDuration | Timer | 


 | 


 |
| traffic.class | Counter | 


 | 


 |
| traffic.size | Counter | 


 | 


 |
| appCache.requestTime | Timer | 


 | 


 |
| appCache.requests | Counter | 


 | 


 |
| ftlTemplates.requests | Counter | Anzahl der vom Webserver erzeugten Seitenanzeigeanforderungen | 


 |
| staticFile.requests | Counter | Anzahl der Anzeigeanforderungen für statische Seiten | 


 |
| packetsCount | Counter | Anzahl der vom Dienst übertragenen Pakete | Wird verwendet, um zu sehen, in welchem Umfang der Messaging-Dienst genutzt wird und ob er ordnungsgemäß oder nicht mehr funktioniert |
| authCount | Counter | Anzahl der abgeschlossenen Anfragen | 
- Status ok: Anfragen wurden validiert (z.B. Authentifizierung akzeptiert für Login/Pass, die von einer Person eingegeben wurden)
- Status fehlgeschlagen: Validierung abgelehnt (z.B. Authentifizierung fehlgeschlagen aufgrund eines falschen Passworts)

 |
| cpu | 


 | Prozessorauslastungsdaten | Ermöglicht die Steuerung der Verwendung und Verteilung von Prozessoren |
| disk | 


 | Speicherplatzverwaltungsdaten | Ermöglicht die Kontrolle des verwendeten/freien/gesamten/etc. Speicherplatzes pro Festplatte, Partition, Pfad usw. |
| diskio | 


 | Anzahl der geschriebenen/gelesenen Bytes in Echtzeit | Zeigt an, ob die Festplatte richtig oder zu viel arbeitet |
| elasticsearch* | 


 | ElasticSearch betreffende Daten | Weitere Informationen und Details zu ES-Metriken finden Sie in der Dokumentation  | [https://github.com/influxdata/telegraf/tree/master/plugins/inputs/elasticsearch](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/elasticsearch) |
| imapd.process | 


 | 


 | 


 |
| influxdb* | 


 | Daten der Metrik-Speicherdatenbank | 


 |
| kapacitor* | 


 | Daten, die das Tool selbst betreffen | 


 |
| kernel | 


 | 


 | 


 |
| kernel_vmstat | 


 | 


 | 


 |
| mem | 


 | 


 | 


 |
| memcached | 


 | 


 | 


 |
| net | 


 | 


 | 


 |
| netstat | 


 | 


 | 


 |
| nginx | 


 | 


 | 


 |
| phpfpm | 


 | 


 | 


 |
| postfix_queue | 


 | 


 | 


 |
| postgresql | 


 | Informationen über die BlueMind-Datenbank | 


 |
| processes | 


 | 


 | 


 |
| swap | 


 | 


 | 


 |
| syslog | 


 | 


 | 


 |
| system | 


 | 


 | 


 |


