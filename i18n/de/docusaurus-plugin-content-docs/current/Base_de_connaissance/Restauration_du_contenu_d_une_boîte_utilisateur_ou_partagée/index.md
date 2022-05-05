---
title: "Wiederherstellen des Inhalts eines Benutzer- oder geteilten Posteingangs"
confluence_id: 57771950
position: 70
---
# Wiederherstellen des Inhalts eines Benutzer- oder geteilten Posteingangs


## Präsentation

Auf dieser Seite erfahren Sie, wie Sie in den folgenden Fällen vorgehen müssen:

1. Der Inhalt des Posteingangs eines Benutzers oder eines geteilten Posteingangs muss wiederhergestellt werden und die** [Wiederherstellung der Einheit über DataProtect](https://forge.bluemind.net/confluence/display/BM35/Restauration+unitaire+-+Navigation+DataProtect) **hat nicht funktioniert.
2. Der Inhalt des Posteingangs soll **in einem Ordner im Posteingang eines anderen Benutzers oder in einem geteilten Posteingang** wiederhergestellt werden.


BlueMind stellt Ihnen eine Reihe von Shell- und Python-Skripten zur Verfügung, die Sie bei der Wiederherstellung von **zuvor gespeicherten Daten** aus dem betreffenden Posteingang unterstützen.


## Voraussetzungen

Um diese Skripte verwenden zu können, muss [Python-Client](/Guide_du_développeur/API_BlueMind/Client_Python/) auf dem Gerät installiert sein.

## Nützliche Dateien

Laden Sie das Skript `restore.sh` herunter und legen Sie es auf dem Server ab:

[&lt;!-- TODO incorrect embedded file link -->restore.sh](/confluence/download/attachments/57771950/restore.sh?version=1&modificationDate=1639652921392&api=v2) 


:::tip

Die bisherige Datei `updateMboxAcls.py` wird nicht mehr benötigt, ihr Inhalt wurde in das Hauptskript integriert.

:::

## Verfahren

Das Skript `restore.sh` stellt die Posteingang-Daten aus dem Backupverzeichnis im betreffenden oder einem anderen Posteingang in einem Unterordner mit dem Namen `restored_<Timestamp>` wieder her.

Es startet wie folgt:


```
./restore.sh USER|MAILSHARE BACKUP\_PATH USER|MAILSHARE EMAIL\_ADDRESS
```


- `USER|MAILSHARE`: zum Wiederherstellen eines Benutzers geben Sie das Schlagwort USER ein, zum Wiederherstellen eines geteilten Posteingangs geben Sie MAILSHARE ein
- `BACKUP_PATH`: Pfad, in dem sich die Daten im BlueMind-Backupverzeichnis befinden (/var/backups). Der Pfad hat die folgende Form:


**
Boîte utilisateur


**
Boîte partagée


`/var/backups/bluemind/dp_spool/rsync/<IP>/mail/imap/<sauvegarde>/var/spool/cyrus/data/<domaine>/domain/<initiale_domaine>/<domaine>/<initiale_utilisateur>/user/<utilisateur>/`Beispiel für den Benutzer jdoe auf der Domain bluemind.loc :
`/var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/806/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`**Durch die Angabe des Benutzerordners ist es möglich, nur einen bestimmten Unterordner wiederherzustellen.**


`/var/backups/bluemind/dp_spool/rsync/<IP>/mail/imap/<sauvegarde>/var/spool/cyrus/data/<domaine>/domain/<initiale_domaine>/<domaine>/`Beachten Sie dabei, dass bei einem geteilten Posteingang**der anzugebende Pfad bei der betreffenden Domain aufhört**. So ist der Pfad für alle Posteingänge in der Domain immer derselbe,
 zum Beispiel in unserer bluemind.loc-Domain:
`/var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/806/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/`


- `USER|MAILSHARE`: wie das erste Schlüsselwort gibt auch dieses den Typ des Ziel-Posteingangs an, in dem die Wiederherstellung durchgeführt wird, USER für einen Benutzer-Posteingang, MAILSHARE für einen geteilten Posteingang.
- `EMAIL_ADDRESS`: E-Mail-Adresse des Zielbenutzers oder des geteilten Posteingangs


Es gibt also 4 mögliche Anwendungen:


**
Utilisateur > Utilisateur


**
Utilisateur > Boîte partagée


**
Boîte partagée > Utilisateur


**
Boîte partagée > Boîte partagée


```
./restore.sh USER jdoe@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/ USER hannibal@bluemind.loc
```


```
./restore.sh USER jdoe@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/ MAILSHARE contact@bluemind.loc
```


```
./restore.sh MAILSHARE contact@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/ USER jdoe@bluemind.loc
```


```
./restore.sh MAILSHARE contact@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/ MAILSHARE contact@bluemind.loc
```


Speichern


