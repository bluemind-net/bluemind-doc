---
title: "Disaster Recovery Plan (DRP)"
confluence_id: 57771731
position: 52
---
# Disaster Recovery Plan (DRP)


## Präsentation

Diese Dokumentation beschreibt die DRP-Prozedur, über die eine BlueMind-Architektur aus einem Backup aufgebaut werden kann. Die Wiederherstellung eines Servers kann sehr zeitaufwendig sein und sollte nur als letzter Ausweg verwendet werden.


## Voraussetzungen

1. Installieren Sie die BlueMind-Architektur **(alle Server**) identisch neu:
    - gleiche Dimensionierung und Partitionierung (Festplattengröße, Partitionsverteilung, NFS-Zugriff usw.)
    - gleiche IP-Adressen
    - gleiche externe URL
    - gleiche Version von BlueMind
    - wenn möglich, sollten auch identische Betriebssysteme der gleichen Version verwendet werden


:::tip

Wenn die Wiederherstellung auf einem Ubuntu-Server in der Version 18.04 durchgeführt wird, muss Python in der **Version 2.7** installiert sein

:::

2. den BlueMind-Einrichtungsassistenten starten
3. die wiederherzustellenden BlueMind-Backupdaten im Ordner `/var/backups/bluemind` im **Lese- und Schreibmodus** **von allen BlueMind-Knoten** aus zugänglich machen


## Verfahren

Führen Sie **auf jedem BlueMind-Knoten** den folgenden Befehl aus:


```
/usr/share/bm-node/bm-pra-restore.py
```


Das Werkzeug listet die verfügbaren Backup-Generationen auf und ermöglicht die Auswahl der Generation, die Sie wiederherstellen möchten.


:::info

Wählen Sie auf jedem BlueMind-Knoten die gleiche Generation.

:::

Die DRP ist abgeschlossen, wenn der Befehl auf allen Knoten der BlueMind-Architektur erfolgreich ausgeführt wurde.

## Anschließend

1. Wenn Sie ein Abonnement haben, folgen Sie der Installationsanleitung, um es neu zu installieren: [Implementierung des Abonnements](https://forge.bluemind.net/confluence/display/BM35/Mise+en+oeuvre+de+la+souscription)
2. Melden Sie sich an der Administrationskonsole als* [admin0@global.virt](mailto:admin0@global.virt) * an, dann:
    - gehen Sie zu Sicherheit > Firewall-Management > klicken Sie auf die Schaltfläche "Speichern"Dies erzwingt die Neugenerierung der BlueMind-Firewall-Regeln
    - gehen Sie zu Systemadministration > Mail-Wartung > klicken Sie auf die Schaltfläche "Ausführen"Damit können Sie die Postfix-Mail-Routing-Tabellen neu generieren
    - gehen Sie zu Sicherheit > Zertifikat ändern und installieren Sie das SSL-Zertifikat neuHinweis: Das Zertifikat, sein privater Schlüssel sowie das/die Zertifikat(e) der Administrationskonsole sind in der Datei `/etc/ssl/certs/bm_cert.pem` auf dem BlueMind-Server verfügbar
3. Installieren Sie alle notwendigen Plugins neu (LDAP/AD-Import...).


