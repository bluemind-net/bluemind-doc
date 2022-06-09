---
title: "IMAP-Identifikationsfehler"
confluence_id: 57771838
position: 64
---
# IMAP-Identifikationsfehler


## Symptome

- Die Benutzer können sich überhaupt nicht mehr anmelden
- Fehler 'Bad Gateway' beim Webzugriff
- Gelegentlich treten Verbindungsprobleme auf


## Problem

Wenn die maximale Anzahl von IMAP-Prozessen erreicht ist, liegen bei Benutzern Login-Fehler vor.

## Lösung

Die maximale Anzahl der IMAP-Prozesse sollte erhöht werden.
Im Allgemeinen benötigt man für eine gemischte Webmailer-/Fat-Client-Nutzung etwa die 1,5-fache Anzahl an Benutzern. Auf Installationen, auf denen viele Benutzer Fat Clients verwenden, zählt man etwa die dreifache Anzahl von Benutzern.

1. Die Anzahl der aktuell verwendeten Prozesse zählen:


```
pgrep -c imap
```


2. Gehen Sie in die Administrationskonsole > Systemkonfiguration > Registerkarte Messaging und erhöhen Sie den Wert des Feldes "Maxchild" im Abschnitt Cyrus entsprechend der obigen Berechnung:![](../../attachments/57771838/57771840.png)


