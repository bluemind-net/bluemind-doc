---
title: "Wiederherstellen eines Backups von einem externen Speicherort"
confluence_id: 57771751
position: 60
---
# Wiederherstellen eines Backups von einem externen Speicherort


## Einführung

Wenn BlueMind-Backups ausgelagert sind und Daten wiederhergestellt sollen, müssen die Daten zunächst auf dem BlueMind-Server wiederhergestellt werden, bevor der Zugriff möglich ist.


## Methode


:::info

Die IP-Adresse darf sich zwischen dem externen Backup und dem Server, auf dem BlueMind wiederhergestellt werden soll, nicht geändert haben.

Andernfalls muss der Pfad des externen Backups so geändert werden, dass die neue IP angezeigt wird, und nach der Wiederherstellung die IP-Adresse eines BlueMind-Servers ändern (Verfahren auf Anfrage beim BlueMind-Support).

:::

Das Prinzip dieses Vorgangs besteht darin, das Speichervolumen, auf dem das ausgelagerte Backup basiert, vorübergehend zu mounten und dann DataProtect über die Existenz dieser Daten auf dem Server zu informieren.

1. Das externe Verzeichnis als *--bind* in das BlueMind-Backupverzeichnis mounten:


```
mount --bind <sauvegarde\_externe> /var/backups/bluemind/
```


2. Den DataProtect-Browser erneut mit dem folgenden Skript synchronisieren:


```
#!/bin/bash

core="http://localhost:8085/services"
latd="admin0@global.virt"
pass=`cat /etc/bm/bm-core.tok`

wget -q -O- \
"${core}/login/doLogin?login=${latd}&password=${pass}&origin=sh" | \
xmllint --format - | \
grep sid| \
sed  's#  <sid>\([^<]\*\)</sid>$#\1#' | tee session.tok

session=`cat session.tok`

wget -q -O- "${core}/dataprotect/syncWithFS?sid=${session}"|xmllint --format -
```


3. Wiederherstellen mit dem [DataProtect-Browser](/Guide_de_l_administrateur/Sauvegarde_et_restauration/Restauration_unitaire_Navigation_DataProtect/)


## Hinweise

Das Mounten von *bind* kann auch verwendet werden, um den Inhalt das letzten vorhandenen Backups vorübergehend durch den Inhalt des externen Backups zu ersetzen, während die Wiederherstellung über den DataProtect-Browser durchgeführt wird.

In diesem Fall ist es nicht notwendig, den Browser neu zu synchronisieren, da das letzte bekannte und bereits referenzierte Backup verwendet wird.

- Um die Mails eines Benutzers wiederherzustellen, kann man folgendes Setup verwenden (z. B. für den Benutzer "admin"):


```
mount --bind <sauvegarde\_externe\_BAL> /var/backups/bluemind/dp\_spool/rsync/172.16.45.161/mail/imap/XXXX/var/spool/cyrus/domain\_tld/domain/d/domain.tld/a/user/admin/
```

XXXX ist die Nummer des letzten Backups des Dateisystems.

- Wenden Sie zur Wiederherstellung der Terminplaner oder Kontakte den gleichen Prozess an, der für die Dump-Wiederherstellung der PostgreSQL-Datenbank im Verzeichnis gilt:


```
/var/backups/bluemind/dp\_spool/rsync/172.16.45.161/bm/pgsql/XXXX/var/backups/bluemind/work/bm\_pgsql/
```


