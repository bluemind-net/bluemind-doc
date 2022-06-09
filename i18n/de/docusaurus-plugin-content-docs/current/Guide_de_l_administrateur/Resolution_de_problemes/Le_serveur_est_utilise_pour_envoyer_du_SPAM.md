---
title: "Der Server wird zum Versenden von SPAM verwendet"
confluence_id: 57771848
position: 72
---
# Der Server wird zum Versenden von SPAM verwendet


## Prüfen Sie, dass der BM-Server kein Open-Relay-Server ist

Postfix ist standardmäßig als Open-Relay-Server konfiguriert, was es den verschiedenen Diensten (Webmailer, EAS) ermöglicht, Mails zu senden. Über die Administrationskonsole können neue vertrauenswürdige IPs hinzugefügt werden, die das Recht haben, Mails über den BM-Server zu senden, in der Regel ist es der Server des internen IS (Urlaubsverwaltungssoftware, Monitoring usw.).

Wenn einer dieser Server beschädigt wird, kann ein Spammer den BM-Server zum Versenden von Spam verwenden.

Das Problem kann am Vorhandensein vieler Zeilen des folgenden Typs erkannt werden:


```
Jun 21 08:34:30 centos7 postfix/smtpd[16863]: connect from gateway[192.168.122.111]
Jun 21 08:34:48 centos7 postfix/smtpd[16863]: 1C205316C411: client=gateway[192.168.122.111]
Jun 21 08:34:58 centos7 postfix/cleanup[16869]: 1C205316C411: message-id=<>
Jun 21 08:34:58 centos7 postfix/qmgr[16801]: 1C205316C411: from=<user1@domain.com>, size=233, nrcpt=1 (queue active)
Jun 21 08:34:59 centos7 postfix/smtp[16821]: 1C205316C411: to=<user2@anotherdomain.net>, relay=smtp.anotherdomain.net[XX.XX.XX.XX]:25, delay=20, delays=20/0/0.35/0.09, dsn=2.0.0, status=sent (250 2.0.0 Ok: queued as 2F10238)
Jun 21 08:34:59 centos7 postfix/qmgr[16801]: 1C205316C411: removed
Jun 21 08:35:04 centos7 postfix/smtpd[16863]: disconnect from gateway[192.168.122.111]


```


Die Client-Zeile gibt hier die IP des Servers an, der diese Mail gesendet hat, in diesem Fall 192.168.122.111; ist sie nicht legitim, bedeutet das, dass dieser Server nicht gesichert ist und zum Versenden von Spam verwendet wird

Zu ergreifende Maßnahmen:

- löschen Sie die IP des fehlerhaften Servers in der BM-Administrationskonsole und speichern Sie die Konfiguration


## Den Benutzer ausfindig machen, der zum Senden von SPAM verwendet wird

Meistens geht das Problem von einem Spammer aus, der – oft durch Bruteforce – das Passwort eines Benutzerkontos gefunden hat und es zum Versenden von SPAM verwendet.

Sie erkennen smtp-Verbindungen an dem Vorhandensein vieler Zeilen des Typs :


```
May  5 00:08:55 hermes postfix/smtpd[27666]: 7E079B666CC: client=unknown[46.48.93.60], sasl\_method=LOGIN, sasl\_username=admin
```


Zu ergreifende Maßnahmen:

- Das Passwort des Benutzers ändern: entweder in BM oder im Telefonbuch.
- Alle Sitzungen dieses Benutzers schließen mit dem Befehl:


```
bm-cli user logout login@domain.com
```


- Die Postfix-Warteschlange aufräumen, um die zum Versenden anstehenden Mails zu löschen, um alle Mails in der Warteschlange des Benutzers [login@domain.net](mailto:login@domain.net) zu löschen


```
postqueue -p | tail -n +2 | awk 'BEGIN { RS = "" } /login@domain\.net/ { print $1 }' | tr -d '\*!' | postsuper -d -
```


:::info

Mit diesem Befehl werden alle Mails in der Warteschlange des Benutzers gelöscht, unabhängig davon, ob es sich um SPAM oder tatsächliche Mails des Benutzers handelt.

:::


## Wie kann man sich vor diesen Angriffen schützen?

### Brute-Force-Angriffe begrenzen

Um Brute Force-Versuche einzuschränken, können Sie das [password-bruteforce](https://marketplace.bluemind.net/addons/72/)-Plugin verwenden, das nach 3 fehlgeschlagenen Authentifizierungen Verbindungsversuche für 20 Minuten blockiert.

### Festlegen einer Passwortrichtlinie

Wenn kein Verzeichnis zur Benutzerverwaltung verwendet wird, können Sie das [Plugin](https://forge.bluemind.net/confluence/display/BM40/Administration+des+utilisateurs#Administrationdesutilisateurs-S%C3%A9curit%C3%A9dumotdepasse)[ `password-sizestrength`](https://forge.bluemind.net/confluence/display/BM40/Administration+des+utilisateurs#Administrationdesutilisateurs-S%C3%A9curit%C3%A9dumotdepasse) verwenden, mit dem eine Richtlinie zur Durchsetzung von Passwortregeln eingerichtet werden kann.

## Wie kann man das Problem so früh wie möglich erkennen?

Mit einer Monitoring-Lösung können Sie das Problem schnell erkennen und reagieren, bevor Ihr Server von den verschiedenen Anti-Spam-Diensten auf eine schwarze Liste gesetzt wird.

Mit [Bm-tick](#) können Sie Alarme einrichten, die auf einem signifikanten Anstieg der Anzahl von Mails in der Postfix-Warteschlange basieren. Sie können diesen Alarm über den Alert Builder oder direkt mit dem folgenden Skript konfigurieren:[&lt;!-- TODO incorrect embedded file link -->postfix_queue.tick](/confluence/download/attachments/57771848/postfix_queue.tick?version=1&modificationDate=1561119236334&api=v2)

Dieses Skript sendet eine Warnmail an [admin@domain.net](mailto:admin@domain.net), sobald die Postfix-Warteschlange 200 Nachrichten erreicht. Abhängig von Ihrer Installation ist es natürlich möglich, diese Werte zu konfigurieren.

