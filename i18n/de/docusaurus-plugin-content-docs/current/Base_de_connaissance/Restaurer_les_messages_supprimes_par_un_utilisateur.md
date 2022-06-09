---
title: "Von einem Benutzer gelöschte Nachrichten wiederherstellen"
confluence_id: 66096543
position: 74
---
# Von einem Benutzer gelöschte Nachrichten wiederherstellen


## Präsentation

Ab BlueMind 4.4 wird ein Papierkorb mit einem sogenannten „doppelten Boden“  verwendet: Er bietet eine serverseitige Verzögerung, während der gelöschte E-Mails gespeichert werden. Während dieses Zeitraums kann eine Wiederherstellung durch den Benutzer direkt von seinem Oulook-Client (verbunden in mapi) oder durch den Administrator per Kommandozeile vom Server erfolgen.


## Verfahren

Wenn eine E-Mail vom Benutzer gelöscht wird, löscht der cyrus Mailserver die Nachricht nicht sofort: Die Nachricht wird als gelöscht markiert und ist nicht mehr verfügbar, aber die Datei bleibt erhalten.

IMAP-Clients können den „expunge“-Befehl ausführen, um das sofortige Löschen von Nachrichten zu veranlassen (z.B. über die Option „Papierkorb leeren“). Aber auch hier kann cyrus eine Verzögerung zwischen dem Zeitpunkt, an dem der Benutzer das "expunge" anfordert, und dem tatsächlichen endgültigen Löschen der Nachricht auf dem Server hinzufügen.

Der neue bm-cli-Befehl ermöglicht während dieser Verzögerung das Abrufen der Nachrichten:


```
bm-cli mail unexpunge
```


:::tip

Warum nicht den Befehl cyrux unexpunge verwenden?

Der bm-cli-Befehl ist notwendig, weil der cyrus-Befehl „unexpunge“, der scheinbar dasselbe tut, nicht genügend Informationen an das Replikationsprotokoll zurückgibt und die Verbindung zwischen Cyrus und BlueMind unterbricht.

:::

#### Wiederherstellen der Nachrichten eines Benutzers

Der Benutzer John Doe (Benutzername jdoe@bluemind.loc) fordert die Wiederherstellung von E-Mails an, die in den letzten 2 Tagen gelöscht wurden. Dafür verwenden wir den folgenden Befehl:


```
#> bm-cli mail unexpunge --days 2 jdoe@bluemind.loc
Folder has 1 deleted message(s)
Recovering messages less than 2 day(s)) old
+-----+---------+---------+------------------------------+
| id  | subject | preview | last-modification            |
+-----+---------+---------+------------------------------+
| 406 | Contact |   Boss  | Mon Jan 18 11:36:54 GMT 2021 |
+-----+---------+---------+------------------------------+
Checked 1 deleted item(s), will restore 1 item(s)
```


#### Wiederherstellen der Nachtrichten eines freigegebenen Postfachs

Um Nachrichten aus einem freigegebenen Postfach wiederherzustellen, muss man sich als Benutzer mit Leserechten für diese Nachrichten anmelden. Der Parameter `authn` muss dem Befehl hinzugefügt werden.

Beispiel: Wir möchten die seit gestern gelöschten Nachrichten im Postfach „Contact“ (contact@bluemind.loc) wiederherstellen, für die John Doe Verwaltungsrechte hat


```
#> bm-cli mail unexpunge --days 1 --authn jdoe@bluemind.loc contact@bluemind.loc

Folder has 1 deleted message(s)
Recovering messages less than 1 day(s)) old
+-----+---------+---------+------------------------------+
| id  | subject | preview | last-modification            |
+-----+---------+---------+------------------------------+
| 203 |  Coucou |    XMen | Tue Jan 19 15:22:34 GMT 2021 |
+-----+---------+---------+------------------------------+
Checked 1 deleted item(s), will restore 1 item(s)
```


## Wenn Sie mehr erfahren möchten

### Konfiguration

Die maximale Verzögerung zwischen einem `expunge-Befehl` und einer `unexpunge`-Wiederherstellung wird in Cyrus `/etc/cyrus.conf` mit dem Befehl `delprune`, Parameter -X, konfiguriert.

Die Standardverzögerung beträgt 7 Tage.

### Verwendung

Zur Verfeinerung der Wiederherstellung können verschiedene Parameter verwendet werden:

- Days: die Anzahl der wiederherzustellenden Tage
- Dry: den Befehl testen, ohne die Wiederherstellung tatsächlich auszuführen
- Folder: einen bestimmten Ordner angeben
- id: die ID einer bestimmten Nachricht


Weitere Einzelheiten zu den verfügbaren Optionen und ihrer Verwendung finden Sie in der Online-Hilfe für den Befehl:


```
# bm-cli mail help unexpunge
```


