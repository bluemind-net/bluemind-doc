---
title: "Logs - Protokolldateien"
confluence_id: 57771649
position: 52
---
# Logs - Protokolldateien


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

## Log-Dateien

Die Protokolldateien befinden sich im Ordner `/var/log` und seinen Unterordnern

| Komponente | Paketname | Log-Datei | Typ | Beschreibung |
| --- | --- | --- | --- | --- |
| BlueMind Core | bm-core | 
./bm/ :
 | 
- core.log
- mail-index.log
- slow-call.log

 | 
./bm/audit/ :
 | 
- audit-calendar*.log

 | LogBack | 
BlueMind-Hauptdienst:
 | 
- Datenbank-Content-Management, Implementierung von Geschäftsregeln
- Indizierung von Mails bei der Durchführung von Re-Indizierungsaufgaben
- Anfragen, die mehr als 200 ms zur Ausführung benötigten

 | 
Audit:
 | 
- Verfolgt die Aktionen, die in dem Kalender durchgeführt werden, der im Dateinamen angegebenen wird: audit-calendar:&lt;Kalendername>:&lt;uid Benutzer>.log

 |
| Postfix | postfix | 
RedHat: ./maillog
 | 
Debian/Ubuntu:
 | 
- ./mail.err
- ./mail.info
- ./mail.log
- ./mail.warn

 | System | 
[Postfix](http://postfix.org/) E-Mail-Weiterleitungsdienst, der die Weiterleitung von E-Mails an den Posteingang oder den Server des Empfängers ermöglicht.
 |
| Cyrus | bm-cyrus-imapd | 
RedHat: ./maillog
 | 
Debian/Ubuntu:
 | 
- ./mail.err
- ./mail.info
- ./mail.log
- ./mail.warn

 | System | 
[Cyrus IMAP](https://www.cyrusimap.org/) Posteingang-Verwaltungsdienst. Ermöglicht Folgendes:
 | 
- Eine E-Mail zurück in den entsprechenden Posteingang senden und per IMAP und/oder POP abrufen.
- E-Mails beim Empfang filtern
- Abwesenheitsmeldung verwalten
- Weiterleitungen verwalten

 |
| Webmailer | bm-webmail | ./bm-webmail : | 


 | 
- Errors
- sendmailmailSent.log

 | LogBack | 


 | 
- Fehler im Webmailer-Dienst (RoundCube)
- die gesendeten E-Mails sowie die in diese Nachrichten analysierten Regeln (Aliase, Umleitung usw.) verfolgen

 |
| EAS-Synchronisation | bm-eas | ./bm-eas/eas.log | LogBack | Verfolgt die Vorgänge, die von und zu den in EAS verbundenen mobilen Geräten durchgeführt werden. | 


 | Die Log-Dateien für jede Sync-Warteschlange werden in separaten Dateien gespeichert, um die Analyse von Fehlern oder unangemessenem Verhalten zu erleichtern. |
| Mail-Übertragung | bm-lmtpd | ./bm-lmtpd/lmtpd.log | LogBack | 
Dienst für die Zustellung einer E-Mail an den entsprechenden Posteingang.
 | 
Einige BlueMind-bezogene Operationen werden auf dieser Ebene durchgeführt – die Analyse von ICS-Einladungen zum Beispiel.
 |
| Standort | bm-locator | 
./bm-locator/locator.log
 | LogBack | Findet die Dienste, die einem Benutzer zugeordnet sind (Mail-Server usw.) |
| Mapi | bm-mapi | 
./mapi.log
./activities.log
 | LogBack | Allgemeines Protokoll des mapi-Dienstes  | 


 | Aktivitätsprotokoll | 


 |  Ausführlichere Informationen finden Sie auf der Seite, die der  | [Fehlerbehebung mit Outlook](https://forge.bluemind.net/confluence/display/BM40/Resolution+des+problemes+avec+Outlook) | gewidmet ist. |
| Replikation | 


 | ./bm/replication.log | LogBack | 


 |
| Identifikation | bm-node | ./bm-node/node.log | LogBack | 
Dienst, der es dem BM-Core-Server ermöglicht, Systemvorgänge auf Knoten der BlueMind-Architektur auszuführen.
Die Log-Datei zeichnet die ausgeführten Befehle auf.
 |
| BlueMind-Webserver | bm-webserver | ./bm-webserver: | 


 | 
- webserver.log
- dav.log
- js-errors.log
- setup.log

 | LogBack | 
Verzeichnis, das die vom *Webserver-Dienst* generierten Log-Dateien enthält.
 | 
- Synchronisierung von Kalendern und Terminplanern.
- Synchronisation über caldav/carddav
- JS-Fehler bei Webanwendungen
- BlueMind-Updates

 |
| Authentifizierung | bm-hps | ./bm-hps/hps.log | LogBack | Verfolgt Probleme und Erfolge bei der Authentifizierung und Anmeldung |
| Tika | bm-tika | ./bm-tika/tika.log | LogBack | 
Extraktion von Metadaten und Daten aus den Dokumenten, die zum Auffüllen des ES-Index verwendet werden.
Verfolgt Fehler bei der Extraktion der zu indizierenden Informationen.
 |
| PHP FPM | bm-php-fpm | 
./bm-php-fpm :
 | 
- bm-php-fpm.log
- slow.log

 | LogBack | 
PHP-Interpreter.
 | 
Die Datei `slow.log` enthält PHP-Anfragen, die länger als 15s gedauert haben.
 |
| ElasticSearch | bm-elasticsearch | ./bm-elasticsearch | Intern | 
Log-Dateien des ElasticSearch-Dienstes.

Die Dateien `*_slowlog.log` enthalten langsame Abfragen.

Alle Änderungen an der Konfiguration der Protokolle dieses Dienstes können nach einem Update von BlueMind verloren gehen.
 |
| Milter | bm-filter | ./bm-milter/milter.log | LogBack | Analyse und Modifikation von E-Mails auf SMTP-Ebene |
| XMPP | bm-xmpp | ./bm-xmpp/xmpp.log | LogBack | Instant Messenger Log-Dateien |
| YSNP | bm-ysnp | ./bm-ysnp/ysnp.log | LogBack | 
Dienst, der es Postfix oder Cyrus ermöglicht, bestimmte Daten von BlueMind zu erhalten oder zu validieren:
 | 
- SMTP- und IMAP-Authentifizierung
- Lösung von IMAP-ACLs
- Blockierung des Mailflusses in Fällen, in denen BlueMind gewartet oder aktualisiert wird

 |
| PostgreSQL | bm-postgresql | ./postgresql | Intern+logrotate | 
[PostgreSQL](http://postgresql.org/)-Datenbankprotokolle
 | 
Seine Konfiguration kann mit der Datei */etc/postgresql/9.6/main/postgresql.conf.local* geändert werden
 |
| NGinx | bm-nginx | 
./nginx :
 | 
- access.log
- error.log
- webmail.log

 | Intern+logrotate | 
Der [NGinx-Dienst](http://nginx.org/) bietet HTTP- und HTTPs-Zugriff auf BlueMind.
 | 
- `access.log` enthält alle an BlueMind gestellten HTTP- und HTTP-Anfragen
- `error.log` enthält alle HTTP- und HTTP-Anfragen, die fehlerhaft sind oder deren Rückgabecode einen Fehler anzeigt (4xx, 5xx)
- `webmail.log` enthält alle HTTP- und HTTP-Anfragen, die über das Webmailer fehlerhaft ausgeführt wurden oder deren Rückgabecode einen Fehler anzeigt (4xx, 5xx)

 |


